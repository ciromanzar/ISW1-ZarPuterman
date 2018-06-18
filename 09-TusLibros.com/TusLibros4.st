!classDefinition: #APIRestInterfaceTest category: #TusLibros!
TestCase subclass: #APIRestInterfaceTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInterfaceTest methodsFor: 'setup' stamp: 'CZ 6/14/2018 21:12:53'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 02:00:50'!
test01cannotCreateCartWithNonExistingClient
	|interface aDateTime|
	
	 interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	
	self
		should: [ interface createCartAs: testObjectsFactory invalidUser with: testObjectsFactory invalidUsersPassword on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 02:01:56'!
test02cannotCreateCartWithExistingClientAndInvalidPassword
	|interface aDateTime|
	
	 interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	
	self
		should: [ interface createCartAs: testObjectsFactory validUser with: testObjectsFactory invalidUsersPassword on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 02:02:14'!
test03createCartWithExistingClientValidPasswordReturnsCartId
	|interface aDateTime cartId|
	
	 interface := testObjectsFactory defaultInterface.
	

	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	self assert: cartId = 1.! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 02:09:02'!
test04cannotAddItemToNonExistingCartId
	|interface aDateTime cartId|
	
	 interface := testObjectsFactory defaultInterface.
	

	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
		self
		should: [ interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId + 1 on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface nonExistingCartIdErrorMessage ].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'lp 6/18/2018 10:24:06'!
test05cannotAddItemToExistingCartThatDoesNotBelongToStore
	|interface aDateTime cartId|
	
	 interface := testObjectsFactory defaultInterface.
	

	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
		self
		should: [ interface add: 1 of: (testObjectsFactory itemNotSellByTheStore) to: cartId  on: aDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage ].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:38:13'!
test06cannotAddItemToExpiredCart
	|interface aDateTime anotherDateTime cartId|
	
	 interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	anotherDateTime := DateAndTime tomorrow .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
		self
		should: [ interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId  on: anotherDateTime. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = APIRestInterface expiredCartErrorMessage].! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'lp 6/18/2018 10:25:32'!
test07listEmptyCartReturnsEmptyCollection
	|interface aDateTime cartId itemList|
	
	 interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	itemList := interface listCart: cartId on: aDateTime.
	
	self assert: itemList isEmpty .! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'lp 6/18/2018 10:56:00'!
test08CannotListCartOfNonExistingCart

	|interface aDateTime cartId|
	
	interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	cartId := cartId + 1.

	self 
		should: [interface listCart: cartId on: aDateTime.] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface nonExistingCartIdErrorMessage]! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:52:50'!
test08_2CannotListExpiredCart

	|interface aDateTime cartId anotherDateTime|
	
	interface := testObjectsFactory defaultInterface.
	
	aDateTime := DateAndTime today.
	anotherDateTime := DateAndTime tomorrow .	
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 

	self 
		should: [interface listCart: cartId on: anotherDateTime.] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface expiredCartErrorMessage ]! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:40:56'!
test09listCartWithItemsReturnsNumberOfItems
	|interface aDateTime cartId itemList|
	
	aDateTime := DateAndTime today.

	interface := testObjectsFactory defaultInterface.
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 

	interface add: 1 of: testObjectsFactory itemSellByTheStore to: cartId on: aDateTime .
			
	itemList := interface listCart: cartId on: aDateTime.
	
	self deny: itemList isEmpty .
	self assert: itemList size = 1.
	self assert: (itemList at: 1) = testObjectsFactory itemSellByTheStore.


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:44:11'!
test10CannotCheckoutANonExistentCart

	|interface aDateTime cartId|
	
	aDateTime := DateAndTime today.

	interface := testObjectsFactory defaultInterface .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	cartId := cartId + 1.
	
	self 
		should: [interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: 'Natalia Natalia' andExpirationDate: self on: aDateTime ] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface nonExistingCartIdErrorMessage]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:48:57'!
test11CannotCheckoutAnEmptyCart

	|interface aDateTime cartId|
	
	aDateTime := DateAndTime today.

	interface := testObjectsFactory defaultInterface .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	self 
		should: [interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: 'Natalia Natalia' andExpirationDate: self on: aDateTime] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface emptyCartErrorMessage ]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:50:27'!
test11_2CannotCheckoutAnExpiredCart

	|interface aDateTime cartId anotherDateTime|
	
	aDateTime := DateAndTime today.
	anotherDateTime := DateAndTime tomorrow .
		
	interface := testObjectsFactory defaultInterface .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	 interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId  on: aDateTime .

	self 
		should: [interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: 'Natalia Natalia' andExpirationDate: testObjectsFactory expiredMonthOfYear on: anotherDateTime ] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface expiredCartErrorMessage ]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:49:07'!
test12CannotCheckoutPayingWithExpiredCard

	|interface aDateTime cartId|
	
	aDateTime := DateAndTime today.

	interface := testObjectsFactory defaultInterface .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	
	 interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId  on: aDateTime .

	self 
		should: [interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: 'Natalia Natalia' andExpirationDate: testObjectsFactory expiredMonthOfYear on: aDateTime ] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface expiredCardErrorMessage ]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:49:13'!
test13CanCheckoutACart

	|interface aDateTime cartId |
	
	aDateTime := DateAndTime today.

	interface := testObjectsFactory defaultInterface .	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId  on: aDateTime .
	self 
		shouldnt: [interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: (testObjectsFactory validUser) andExpirationDate: testObjectsFactory notExpiredMonthOfYear on: aDateTime ] 
		raise: Error.
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'lp 6/18/2018 15:05:37'!
test14CannotListPurchasesOfNonExistentClient

	|interface|
	
	interface := testObjectsFactory defaultInterface .
	

	self 
		should: [interface listPurchasesOf: testObjectsFactory invalidUser withPassword: testObjectsFactory invalidUsersPassword ] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage ]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'lp 6/18/2018 15:05:55'!
test15CannotListPurchasesOfNonAuthenticatedClient

	|interface|
	
	interface := testObjectsFactory defaultInterface .
	

	self 
		should: [interface listPurchasesOf: testObjectsFactory validUser withPassword: testObjectsFactory invalidUsersPassword ] 
		raise: Error
		withExceptionDo: [ :anError | 
			self assert: anError messageText = APIRestInterface wrongUsernameOrPasswordErrorMessage ]
	


	


! !

!APIRestInterfaceTest methodsFor: 'Testing' stamp: 'CZ 6/18/2018 16:49:23'!
test16ListPurchasesReturnsAcquiredItems

	|interface cartId aDateTime purchasesList|
	
	aDateTime := DateAndTime today.
	
	interface := testObjectsFactory defaultInterface .
	
	cartId := interface createCartAs: testObjectsFactory validUser with: testObjectsFactory validUsersPassword on: aDateTime. 
	interface add: 1 of: (testObjectsFactory itemSellByTheStore) to: cartId  on: aDateTime .
	interface checkoutCartWithId: cartId payingWith: 123456790287  ownedBy: (testObjectsFactory validUser) andExpirationDate: testObjectsFactory notExpiredMonthOfYear on: aDateTime.
	
	purchasesList := interface listPurchasesOf: testObjectsFactory validUser withPassword: testObjectsFactory validUsersPassword .
	

	self assert: purchasesList size = 1.
	
	


	


! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'CZ 6/18/2018 02:11:32'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'CZ 6/18/2018 02:11:26'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'CZ 6/18/2018 02:11:21'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cart invalidItemErrorMessage.
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
	instanceVariableNames: 'carts catalog userList merchantProcessor salesBook clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInterface methodsFor: 'initialization' stamp: 'lp 6/18/2018 12:16:38'!
initializeAacceptingItemsOf: aCatalog forUsers: aUserList  registeringOn: aSalesBook debitingVia: aMerchantProcessor measuringTimeWith: aClock
	carts := OrderedCollection new.
	catalog := aCatalog.
	userList := aUserList.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.
	clock := aClock.
! !


!APIRestInterface methodsFor: 'asserting' stamp: 'lp 6/18/2018 14:39:05'!
assert: aCartId isExpiredOn: aDateAndTime
	(aDateAndTime - (carts at: aCartId ) value) totalMinutes > 30 ifTrue:[self error: self class expiredCartErrorMessage ].! !

!APIRestInterface methodsFor: 'asserting' stamp: 'lp 6/18/2018 13:45:08'!
assert: aCartId isValidToUseOn: aDateAndTime
	self assertExists: aCartId.
	self assert: aCartId isExpiredOn: aDateAndTime.! !

!APIRestInterface methodsFor: 'asserting' stamp: 'lp 6/18/2018 14:48:33'!
assertCreditCard: creditCard isNotExpiredAt: aDateTime
	(creditCard isExpiredOn: aDateTime) ifTrue: [self error: self class expiredCardErrorMessage ].! !

!APIRestInterface methodsFor: 'asserting' stamp: 'CZ 6/14/2018 21:35:01'!
assertExisting: aUsername And: aPassword
	((userList includesKey: aUsername) ifTrue: [(userList at: aUsername) = aPassword ] ifFalse: [false]) ifFalse: [self error: self class wrongUsernameOrPasswordErrorMessage ].! !

!APIRestInterface methodsFor: 'asserting' stamp: 'lp 6/18/2018 13:31:36'!
assertExists: aCartId
	^carts size >= aCartId ifFalse: [self error: self class nonExistingCartIdErrorMessage ].! !

!APIRestInterface methodsFor: 'asserting' stamp: 'lp 6/18/2018 13:14:47'!
assertNotEmpty: aCart
	^aCart isEmpty  ifTrue: [self error: self class emptyCartErrorMessage ].! !


!APIRestInterface methodsFor: 'system messages' stamp: 'CZ 6/18/2018 02:55:38'!
add: aQuantity of: anItem to: aCartId on: aDateAndTime 
	self assert: aCartId isValidToUseOn: aDateAndTime.
	
	(carts at: aCartId ) key add: aQuantity of: anItem.
	(carts at: aCartId ) value: aDateAndTime .! !

!APIRestInterface methodsFor: 'system messages' stamp: 'CZ 6/18/2018 16:48:13'!
checkoutCartWithId: aCartId payingWith: aCreditCardNumber ownedBy: aName andExpirationDate: anExpirationDate on: aDateTime
	|creditCard cart|
	creditCard := CreditCard expiringOn: anExpirationDate .
	
	self assertExists: aCartId.
	self assert: aCartId isValidToUseOn: aDateTime.

	cart := (carts at: aCartId) key .
	
	self assertNotEmpty: cart.
	self assertCreditCard: creditCard isNotExpiredAt: clock now. 

	(carts at: aCartId ) value: aDateTime .

	(Cashier toCheckout: cart ownedBy: aName charging: creditCard on: clock now registeringOn: salesBook via: merchantProcessor ) checkOut.
! !

!APIRestInterface methodsFor: 'system messages' stamp: 'CZ 6/18/2018 01:42:26'!
createCartAs: aUsername with: aPassword on: aDateTime
	|cart|
	self assertExisting: aUsername And: aPassword.

	cart := Cart acceptingItemsOf: catalog.
	carts add: (cart -> aDateTime).	

	^carts size.! !

!APIRestInterface methodsFor: 'system messages' stamp: 'CZ 6/18/2018 03:20:11'!
listCart: cartId on: aDateTime
	self assert: cartId isValidToUseOn: aDateTime.
	
	(carts at: cartId ) value: aDateTime .
	^(carts at: cartId ) key items.! !

!APIRestInterface methodsFor: 'system messages' stamp: 'lp 6/18/2018 15:39:00'!
listPurchasesOf: aUsername withPassword: aPassword
	|sales|
	self assertExisting: aUsername And: aPassword.
	sales := self purchasesBy: aUsername.
	^ sales! !

!APIRestInterface methodsFor: 'system messages' stamp: 'lp 6/18/2018 15:25:38'!
purchasesBy: aUser
	^ salesBook select: [ :aSale | aSale wasSoldTo: aUser ]
	

! !

!APIRestInterface methodsFor: 'system messages' stamp: 'lp 6/18/2018 14:24:34'!
withCartWithId: aCartId do: aBlock

	| cart |
	
	self assertExists: aCartId.

	cart := (carts at: aCartId) key .
	
	self assertNotEmpty: cart.
	
	^ [aBlock value: cart] ensure: [ cart lastUsedAt: clock now ] 

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'APIRestInterface class' category: #TusLibros!
APIRestInterface class
	instanceVariableNames: ''!

!APIRestInterface class methodsFor: 'instance creation' stamp: 'lp 6/18/2018 12:15:29'!
acceptingItemsOf: aCatalog forUsers: aUserList registeringOn: aSalesBook debitingVia: aMerchantProcessor measuringTimeWith: aClock

	^self new initializeAacceptingItemsOf: aCatalog forUsers: aUserList  registeringOn: aSalesBook debitingVia: aMerchantProcessor measuringTimeWith: aClock! !


!APIRestInterface class methodsFor: 'error' stamp: 'lp 6/18/2018 13:11:19'!
emptyCartErrorMessage
	^'El carrito esta vacio'.! !

!APIRestInterface class methodsFor: 'error' stamp: 'lp 6/18/2018 11:13:55'!
expiredCardErrorMessage
	^'La tarjeta de credito esta expirada'.! !

!APIRestInterface class methodsFor: 'error' stamp: 'CZ 6/18/2018 02:27:41'!
expiredCartErrorMessage
	^'Sesión del carrito expirada'.! !

!APIRestInterface class methodsFor: 'error' stamp: 'CZ 6/18/2018 01:58:43'!
nonExistingCartIdErrorMessage
	^'Id de carrito inexistente.'.! !

!APIRestInterface class methodsFor: 'error' stamp: 'CZ 6/14/2018 21:23:09'!
wrongUsernameOrPasswordErrorMessage
	^'Usuario o contraseña erroneos'.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'assertions' stamp: 'CZ 6/18/2018 02:13:40'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self class invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'CZ 6/18/2018 02:13:45'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self class invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'CZ 6/18/2018 03:19:54'!
items
	^items copy.! !

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


!Cart class methodsFor: 'error' stamp: 'CZ 6/18/2018 02:10:52'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart class methodsFor: 'error' stamp: 'CZ 6/18/2018 02:11:03'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!classDefinition: #EphemeralCart category: #TusLibros!
Cart subclass: #EphemeralCart
	instanceVariableNames: 'owner lastUsedTime duration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!EphemeralCart methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:43:19'!
initializeFor: aClient at: aTime expiringAfter: aDuration 
	owner := aClient.
	lastUsedTime := aTime.
	duration := aDuration ! !

!EphemeralCart methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:53:58'!
isExpiredAt: aTime 
	^ false! !

!EphemeralCart methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:45:00'!
lastUsedAt: aTime 
	lastUsedTime := aTime ! !

!EphemeralCart methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:44:41'!
owner
	^ owner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EphemeralCart class' category: #TusLibros!
EphemeralCart class
	instanceVariableNames: ''!

!EphemeralCart class methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:42:51'!
for: aClient at: aTime expiringAfter: aDuration
	^self new initializeFor: aClient at: aTime expiringAfter: aDuration ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCart salesBook merchantProcessor user'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:30:53'!
callMerchantProcessorCharging: total on: creditCart
	merchantProcessor charge: total to: creditCart .! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:38:30'!
checkOut
	
	| priceList total |
	
	priceList := cart catalog.
	total := 0.
	cart itemsDo: [ :anItem | total := total + (priceList at: anItem)].
	
	self callMerchantProcessorCharging: total on: creditCart.
	salesBook add: (Sale to: user of: total with: cart items).
	
	^total! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/11/2018 19:13:32'!
initializeToCheckout: aCart charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor
	
	cart := aCart.
	creditCart := aCreditCard.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor .! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:16:21'!
initializeToCheckout: aCart ownedBy: aUser charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor
	
	cart := aCart.
	creditCart := aCreditCard.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor .
	user := aUser .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'lp 6/11/2018 19:14:51'!
toCheckout: aCart charging: aCreditCard on: aDate registeringOn: aSalesBook via: aMerchantProcessor
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor ! !

!Cashier class methodsFor: 'instance creation' stamp: 'lp 6/18/2018 15:16:03'!
toCheckout: aCart ownedBy:aUser charging: aCreditCard on: aDate registeringOn: aSalesBook via: aMerchantProcessor
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart ownedBy: aUser charging: aCreditCard registeringOn: aSalesBook via: aMerchantProcessor ! !


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

!CreditCard methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 14:51:11'!
isExpiredOn: aDate 
	
	^expiration < aDate! !

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
	instanceVariableNames: 'total elements user items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !

!Sale methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:24:49'!
wasSoldTo: anUser
	^ user = anUser .! !


!Sale methodsFor: 'initialization' stamp: 'lp 6/18/2018 15:20:27'!
initializeTo: aUser of: anAmount with: itemsSold
	user:= aUser.
	total := anAmount.
	items := itemsSold.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'lp 6/18/2018 15:19:46'!
to: aUser of: anAmount with: itemsSold

	"should assert total is not negative or 0!!"
	^self new initializeTo: aUser of: anAmount with: itemsSold. ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'lp 6/18/2018 12:28:20'!
createClock
	clock := TestingClock with: self today.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'lp 6/11/2018 19:39:00'!
defaultMerchantProcessor
	
	^ MerchantProcessor withResponse:[true].! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:29:57'!
defaultInterface
	self createClock.
	
	^  APIRestInterface acceptingItemsOf: self defaultCatalog forUsers:  self defaultUserList registeringOn: OrderedCollection new debitingVia: self defaultMerchantProcessor 		measuringTimeWith: clock . ! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:26:32'!
defaultUserList
	
	^ Dictionary new
		at: self validUser put: self validUsersPassword ;
		yourself.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:23:48'!
expiredCreditCard
	
	^CreditCard expiringOn: self expiredMonthOfYear ! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 14:54:03'!
expiredMonthOfYear
	
	^ Date year: (today yearNumber -1) month: (today monthIndex) day: 1.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:25:58'!
invalidUser 
	^'invalidUser'.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'CZ 6/14/2018 21:27:17'!
invalidUsersPassword
	^'invalidUsersPassword'.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:22:47'!
notExpiredCreditCard
	
	^CreditCard expiringOn: self notExpiredMonthOfYear ! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 14:53:44'!
notExpiredMonthOfYear
	^ Date year: (today yearNumber +1) month: (today monthIndex) day: 1.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 15:23:16'!
today
	
	^ today date ! !

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


!classDefinition: #TestingClock category: #TusLibros!
Object subclass: #TestingClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestingClock methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:21:53'!
initializeWith: aTime 

	now := aTime ! !

!TestingClock methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:53:37'!
moveForwardInTime: aDuration 
	
	now := now .! !

!TestingClock methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:22:01'!
now
	
	^ now! !

!TestingClock methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:22:16'!
today
	
	^now asDate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestingClock class' category: #TusLibros!
TestingClock class
	instanceVariableNames: ''!

!TestingClock class methodsFor: 'as yet unclassified' stamp: 'lp 6/18/2018 12:49:20'!
with: aDateAndTime
	^ self new initializeWith: aDateAndTime.! !
