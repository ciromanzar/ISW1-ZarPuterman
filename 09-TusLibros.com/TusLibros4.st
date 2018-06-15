!classDefinition: #APIRestInterfaceTest category: #TusLibros!
TestCase subclass: #APIRestInterfaceTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInterfaceTest methodsFor: 'setup' stamp: 'CZ 6/14/2018 21:12:53'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/14/2018 21:27:33'!
test01createCartWithNonExistingClientReturnsError
	|interface aCatalog aUserList aDateTime|
	
	aCatalog := testObjectsFactory defaultCatalog.	
	aUserList := testObjectsFactory defaultUserList.	
	
	interface := APIRestInterface acceptingItemsOf: aCatalog and: aUserList.
	

	aDateTime := DateAndTime today.
	
	self
		should: [ interface createCartAs: testObjectsFactory invalidUser with: testObjectsFactory invalidUsersPassword on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/14/2018 21:28:01'!
test02createCartWithExistingClientAndInvalidPasswordReturnsError
	|interface aCatalog aUserList aDateTime|
	
	aCatalog := testObjectsFactory defaultCatalog.	
	aUserList := testObjectsFactory defaultUserList.	
	
	interface := APIRestInterface acceptingItemsOf: aCatalog and: aUserList.
	

	aDateTime := DateAndTime today.
	
	self
		should: [ interface createCartAs: testObjectsFactory validUser with: testObjectsFactory invalidUsersPassword on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/14/2018 21:36:27'!
test03createCartWithExistingClientValidPasswordReturnsCartId
	|interface aCatalog aUserList aDateTime cartId |
	
	aCatalog := testObjectsFactory defaultCatalog.	
	aUserList := testObjectsFactory defaultUserList.	
	
	interface := APIRestInterface acceptingItemsOf: aCatalog and: aUserList.
	

	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	self assert: cartId = 1.! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:11'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:48:18'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			on: testObjectsFactory today
			registeringOn:  salesBook 
			via: testObjectsFactory defaultMerchantProcessor]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:39:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier toCheckout: cart charging: testObjectsFactory notExpiredCreditCard on: testObjectsFactory today registeringOn: OrderedCollection new via: testObjectsFactory defaultMerchantProcessor.
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:48:10'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				on: testObjectsFactory today
				registeringOn: salesBook 
				via: testObjectsFactory defaultMerchantProcessor]
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:40:06'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		on: testObjectsFactory today
		registeringOn: salesBook
		via: testObjectsFactory defaultMerchantProcessor.
	total := cashier checkOut.
					
	self assert: salesBook notEmpty.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:47:49'!
test05CashierDoesntCallMerchantProcessorWhenCheckingOutWithExpiredCard
	| cart salesBook merchantProcessor|

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	merchantProcessor := MerchantProcessor withResponse: [self error: MerchantProcessor cannotChargeExpiredCardMessageError].
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				on: testObjectsFactory today
				registeringOn: salesBook
				via: merchantProcessor .
				]
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText ~= MerchantProcessor cannotChargeExpiredCardMessageError.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:47:56'!
test06CannotCheckoutWithStolenCard
	| cart salesBook merchantProcessor cashier |
	cart _ testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook _ OrderedCollection new.
	merchantProcessor _ MerchantProcessor withResponse: [ self error: MerchantProcessor stolenCreditCardMessageError ].
	cashier _ Cashier
		toCheckout: cart
		charging: testObjectsFactory notExpiredCreditCard
		on: testObjectsFactory today
		registeringOn: salesBook
		via: merchantProcessor.
	self
		should: [ cashier checkOut ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MerchantProcessor stolenCreditCardMessageError.
			self assert: salesBook isEmpty ].! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:48:00'!
test07CannotCheckoutWithCreditCardWithoutCredit

	| cart salesBook merchantProcessor cashier|

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.

	merchantProcessor := MerchantProcessor withResponse: [self error: MerchantProcessor creditCardWithoutCreditMessageError].

cashier := Cashier 
				toCheckout: cart 
				charging: testObjectsFactory notExpiredCreditCard 
				on: testObjectsFactory today
				registeringOn: salesBook
				via: merchantProcessor.
				
	self
		should: [cashier checkOut.]
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = MerchantProcessor creditCardWithoutCreditMessageError.
			self assert: salesBook isEmpty ]! !


!classDefinition: #APIRestInterface category: #TusLibros!
Object subclass: #APIRestInterface
	instanceVariableNames: 'carts catalog userList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInterface methodsFor: 'initialization' stamp: 'CZ 6/14/2018 21:14:13'!
initializeAcceptingItemsOf: aCatalog with: aUserList
	carts := Dictionary new.
	catalog := aCatalog.
	userList := aUserList.! !


!APIRestInterface methodsFor: 'creating' stamp: 'CZ 6/14/2018 21:36:16'!
createCartAs: aUsername with: aPassword on: aDateTime
	self assertExisting: aUsername And: aPassword.
	^1.! !


!APIRestInterface methodsFor: 'asserting' stamp: 'CZ 6/14/2018 21:35:01'!
assertExisting: aUsername And: aPassword
	((userList includesKey: aUsername) ifTrue: [(userList at: aUsername) = aPassword ] ifFalse: [false]) ifFalse: [self error: self class wrongUsernameOrPasswordErrorMessage ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'APIRestInterface class' category: #TusLibros!
APIRestInterface class
	instanceVariableNames: ''!

!APIRestInterface class methodsFor: 'instance creation' stamp: 'CZ 6/14/2018 21:14:33'!
acceptingItemsOf: aCatalog and: aUserList
	^self new initializeAcceptingItemsOf: aCatalog with:aUserList.! !


!APIRestInterface class methodsFor: 'error' stamp: 'CZ 6/14/2018 21:23:09'!
wrongUsernameOrPasswordErrorMessage
	^'Usuario o contraseña erroneos'.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:04'!
catalog
	
	^ catalog! !

!Cart methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:05'!
itemsDo: aBlock
	
	^items do: aBlock ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCart salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:30:53'!
callMerchantProcessorCharging: total on: creditCart
	merchantProcessor charge: total to: creditCart .! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:29:44'!
checkOut
	
	| priceList total |
	
	priceList := cart catalog.
	total := 0.
	cart itemsDo: [ :anItem | total := total + (priceList at: anItem)].
	
	self callMerchantProcessorCharging: total on: creditCart.
	
	salesBook add: (Sale of: total).
	
	^total! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:13:32'!
initializeToCheckout: aCart charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor
	
	cart := aCart.
	creditCart := aCreditCard.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'lp 6/11/2018 19:14:51'!
toCheckout: aCart charging: aCreditCard on: aDate registeringOn: aSalesBook via: aMerchantProcessor
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor ! !


!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: 'response'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'checkout' stamp: 'lp 6/11/2018 19:18:26'!
charge: anAmount to: aCreditCard
	^ response value.! !


!MerchantProcessor methodsFor: 'initialization' stamp: 'lp 6/11/2018 19:17:15'!
initializeWithResponse: aBlock
	response := aBlock.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: #TusLibros!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error' stamp: 'lp 6/11/2018 19:20:47'!
cannotChargeExpiredCardMessageError
	^'cannot charge an expired credit card'.! !

!MerchantProcessor class methodsFor: 'error' stamp: 'lp 6/11/2018 19:36:40'!
creditCardWithoutCreditMessageError
	^'no credit on credit card'.! !

!MerchantProcessor class methodsFor: 'error' stamp: 'lp 6/11/2018 19:37:13'!
stolenCreditCardMessageError
	^ 'stolen credit card'.! !


!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:16:26'!
withResponse: aBlock
	^self new initializeWithResponse: aBlock.! !


!classDefinition: #MonthOfYear category: #TusLibros!
Object subclass: #MonthOfYear
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MonthOfYear class' category: #TusLibros!
MonthOfYear class
	instanceVariableNames: ''!

!MonthOfYear class methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:34'!
of: aDate 
	self shouldBeImplemented.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'lp 6/11/2018 19:39:00'!
defaultMerchantProcessor
	
	^ MerchantProcessor withResponse:[true].! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:26:32'!
defaultUserList
	
	^ Dictionary new
		at: self validUser put: self validUsersPassword ;
		yourself.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:25:58'!
invalidUser 
	^'invalidUser'.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:27:17'!
invalidUsersPassword
	^'invalidUsersPassword'.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:25:47'!
validUser 
	^'validUser'.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:26:22'!
validUsersPassword
	^'validUsersPassword'.! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !
