!classDefinition: #TusLibrosTest category: #'TusLibros.com'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!TusLibrosTest methodsFor: 'test support' stamp: 'lp 6/9/2018 20:15:32'!
createCreditCardWithExpirationOn012018
	^CreditCard expiringOn: (MonthOfYear with: 01 of: 2018).! !

!TusLibrosTest methodsFor: 'test support' stamp: 'lp 6/9/2018 20:15:49'!
createCreditCardWithExpirationOn012019
	^CreditCard expiringOn: (MonthOfYear with: 01 of: 2019).! !

!TusLibrosTest methodsFor: 'test support' stamp: 'CZ 6/7/2018 20:57:21'!
createEmptyCart
	^Cart with: Dictionary new.! !


!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:06:13'!
createCartWithCatalogueWithElPrincipitoPriced10
	|catalogue|
	catalogue := Dictionary new.
	catalogue add: ('El Principito'-> 10).
	^ Cart with: catalogue.
! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:10:06'!
createCartWithCatalogueWithElPrincipitoPriced10AndElAlephPriced20
	|catalogue|
	catalogue := Dictionary new.
	catalogue add: ('El Principito'-> 10).
	catalogue add: ('El Aleph'-> 20).
	^ Cart with: catalogue.
! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:05:51'!
createCartWithElPrincipitoPriced10
	|cart |
	
	cart := self createCartWithCatalogueWithElPrincipitoPriced10.	
	cart add: 'El Principito'.
	^cart.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:09:42'!
createCartWithElPrincipitoPriced10AndElAlephPriced20
	|cart |
	
	cart := self createCartWithCatalogueWithElPrincipitoPriced10AndElAlephPriced20.	
	cart add: 'El Principito'.
	cart add: 'El Aleph'.
	^cart.! !


!classDefinition: #CartTest category: #'TusLibros.com'!
TusLibrosTest subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 20:58:42'!
test01newCartIsEmptyCart
	|cart|
	cart := self createEmptyCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:02:27'!
test02aCartWithABookIsNotEmpty
	|cart|
	cart := self createCartWithElPrincipitoPriced10.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:03:08'!
test03cannotAddToCartSomethingThatIsNotInTheCatalogue
	|cart|
	cart := self createCartWithElPrincipitoPriced10.
	
	self 
		should: [ cart add: 'La Biblia'. ]
		raise: Error
		withExceptionDo: [ :aCart |
			self assert: Cart invalidElementMessageError = aCart messageText ]! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:06:38'!
test04canAddMultipleCopiesOfABook
	|cart|
	cart := self createCartWithCatalogueWithElPrincipitoPriced10 .
	cart add: 2 copiesOf: 'El Principito'.

	self assert: (cart size = 2).! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:08:47'!
test05canAddMoreThanOneBook
	|cart |
	cart := self createCartWithElPrincipitoPriced10AndElAlephPriced20 .
	
	self assert: (cart size = 2).! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:11:30'!
test06aCartKnowsTheAmountOfCopiesOfABookThatItContains
	|cart |
	cart := self createCartWithElPrincipitoPriced10AndElAlephPriced20 .

	self assert: cart size = 2.
	self assert: (cart copiesOf: 'El Principito') = 1.
	self assert: (cart copiesOf: 'El Aleph') = 1.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/7/2018 21:12:39'!
test07aCartContainsZeroOfCopiesOfABookThatItDoesntContain
	|cart |
	cart := self createCartWithCatalogueWithElPrincipitoPriced10AndElAlephPriced20.

	cart add: 2 copiesOf: 'El Principito'.

	self assert: ((cart copiesOf: 'El Aleph') = 0).! !


!classDefinition: #CashierTest category: #'TusLibros.com'!
TusLibrosTest subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 19:57:16'!
test01cannotCheckoutEmptyCart
	| cart today creditCard|
	creditCard := self createCreditCardWithExpirationOn012019.
	today := Date newDay: 07 month: 06 year: 2018.
	
	cart := self createEmptyCart .
	self 
		should: [ Cashier checkingOut: cart payingWith: creditCard on: today. ]
		raise: Error
		withExceptionDo: [ :aCashier |
			self assert: Cashier cannotCheckoutEmptyCartErrorMessage  = aCashier messageText ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:31:29'!
test02cannotCheckoutWithExpiredCreditCard
	| cart today creditCard|
	creditCard := self createCreditCardWithExpirationOn012018.
	today := Date newDay: 07 month: 06 year: 2018.
	cart := self createCartWithElPrincipitoPriced10 .
	
	self 
		should: [ Cashier checkingOut: cart payingWith: creditCard on: today.]
		raise: Error
		withExceptionDo: [ :aCashier |
			self assert: Cashier cannotCheckoutWithExpiredCreditCardErrorMessage  = aCashier messageText ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:29:15'!
test03checkoutACartWithAnElementReturnsElementPrice
	| cashier cart today creditCard|
	creditCard := self createCreditCardWithExpirationOn012019.
	today := Date newDay: 07 month: 06 year: 2018.
	cart := self createCartWithElPrincipitoPriced10 .
	
	cashier := Cashier checkingOut: cart payingWith: creditCard on: today.
	
	self assert: (cashier checkout) = 10.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierTest class' category: #'TusLibros.com'!
CashierTest class
	instanceVariableNames: ''!

!CashierTest class methodsFor: 'tests' stamp: 'CZ 6/7/2018 21:15:53'!
test01cannotCheckoutCartWithoutElements
	! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'elements catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'accesing' stamp: 'lp 6/6/2018 15:53:43'!
copiesOf: aBookCode
	^ (elements select: [:anElem | anElem = aBookCode]) size.! !

!Cart methodsFor: 'accesing' stamp: 'CZ 6/4/2018 21:18:02'!
isEmpty
	^elements isEmpty .! !

!Cart methodsFor: 'accesing' stamp: 'lp 6/6/2018 15:52:12'!
size
	^ elements size.! !

!Cart methodsFor: 'accesing' stamp: 'CZ 6/7/2018 21:40:34'!
totalAmount
	^elements inject: 0 into: [:subtotal :element | subtotal + catalogue at: element ].! !


!Cart methodsFor: 'adding' stamp: 'lp 6/6/2018 14:45:22'!
add: aBookCode
	self add: 1 copiesOf: aBookCode.! !

!Cart methodsFor: 'adding' stamp: 'lp 6/6/2018 15:51:41'!
add: anAmount copiesOf: aBookCode
	self assertABookCodeIsInCatalogue: aBookCode .
	1 to: anAmount do: [:aNumber | elements add: aBookCode].! !


!Cart methodsFor: 'initialization' stamp: 'lp 6/6/2018 15:32:13'!
initializeWith: aCatalogue
	catalogue := aCatalogue.
	elements := OrderedCollection  new.! !


!Cart methodsFor: 'asserting - private' stamp: 'lp 6/6/2018 15:34:19'!
assertABookCodeIsInCart: aBookCode
	(elements includes: aBookCode) ifFalse: [self error: self class removingInexistentElementMessageError] .
! !

!Cart methodsFor: 'asserting - private' stamp: 'CZ 6/7/2018 20:55:49'!
assertABookCodeIsInCatalogue: aBookCode

	(catalogue includesKey: aBookCode) ifFalse: [ self error: self class invalidElementMessageError ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error' stamp: 'lp 6/6/2018 15:42:41'!
cannotRemoveMoreElementsThatContainedInCartMessageError
	^'No se pueden borrar mas elementos de los contenidos'! !

!Cart class methodsFor: 'error' stamp: 'CZ 6/4/2018 21:24:06'!
invalidElementMessageError
	^'Solo se pueden agregar libros al carrito'! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'lp 6/6/2018 14:28:06'!
with: aCatalogue
	^ self new initializeWith: aCatalogue.! !


!classDefinition: #Cashier category: #'TusLibros.com'!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cashier methodsFor: 'asserting' stamp: 'lp 6/9/2018 20:31:05'!
assert: aCreditCard isNotExpiredOn: aDate.
	(aCreditCard isNotExpiredOn: aDate) ifFalse: [self error: self class cannotCheckoutWithExpiredCreditCardErrorMessage]. ! !

!Cashier methodsFor: 'asserting' stamp: 'CZ 6/7/2018 21:30:06'!
assertIsNotEmpty: aCart
	(aCart isEmpty) ifTrue: [self error: self class cannotCheckoutEmptyCartErrorMessage]. ! !


!Cashier methodsFor: 'checkout' stamp: 'lp 6/9/2018 20:29:36'!
checkout
	
	^cart totalAmount.! !

!Cashier methodsFor: 'checkout' stamp: 'CZ 6/7/2018 21:26:09'!
checkout: aCart with: aCreditCard on: aDate
	self assertIsNotEmpty: aCart.
	self assert: aCreditCard isNotExpiredOn: aDate.
	
	^aCart totalAmount.! !


!Cashier methodsFor: 'initialization' stamp: 'lp 6/9/2018 20:27:47'!
initializeWith: aCart paymentWith: aCreditCard on: aDate
	self assertIsNotEmpty: aCart.
	self assert: aCreditCard isNotExpiredOn: aDate.
	
	cart := aCart.
	creditCard := aCreditCard.
	date := aDate.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros.com'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'errors' stamp: 'CZ 6/7/2018 21:30:19'!
cannotCheckoutEmptyCartErrorMessage
	^'No se puede checkoutear un carrito vacio.'.! !

!Cashier class methodsFor: 'errors' stamp: 'CZ 6/7/2018 21:30:28'!
cannotCheckoutWithExpiredCreditCardErrorMessage
	^'No se puede checkoutear con una tarjeta vencida.'.! !


!Cashier class methodsFor: 'class initialization' stamp: 'lp 6/9/2018 19:55:27'!
checkingOut: aCart payingWith: aCreditCard on: aDate
	^ self new initializeWith: aCart paymentWith: aCreditCard  on: aDate. ! !


!classDefinition: #CreditCard category: #'TusLibros.com'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CreditCard methodsFor: 'accesing' stamp: 'CZ 6/7/2018 21:35:30'!
expirationDate
	^expirationDate .! !


!CreditCard methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:05:51'!
initializeWithExpiration: aMonthOfYear 
	expirationDate := aMonthOfYear.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:26:31'!
isNotExpiredOn: aDate
	^ expirationDate isAfter: aDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros.com'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:05:25'!
expiringOn: aMonthOfYear
	^ self new initializeWithExpiration: aMonthOfYear.! !


!classDefinition: #MonthOfYear category: #'TusLibros.com'!
Object subclass: #MonthOfYear
	instanceVariableNames: 'month year'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!MonthOfYear methodsFor: 'initialization' stamp: 'lp 6/9/2018 20:07:41'!
initializeWith: aMonth of: aYear
	month := aMonth.
	year := aYear.! !


!MonthOfYear methodsFor: 'accessing' stamp: 'lp 6/9/2018 20:08:39'!
month
	 ^ month.! !

!MonthOfYear methodsFor: 'accessing' stamp: 'lp 6/9/2018 20:08:44'!
year
	 ^ year.! !


!MonthOfYear methodsFor: 'as yet unclassified' stamp: 'lp 6/9/2018 20:25:05'!
isAfter: aDate
	^ ( (year > aDate yearNumber ) or: ( (year = aDate yearNumber) and: (month > aDate monthIndex ) ) ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MonthOfYear class' category: #'TusLibros.com'!
MonthOfYear class
	instanceVariableNames: ''!

!MonthOfYear class methodsFor: 'class initialization' stamp: 'lp 6/9/2018 20:06:48'!
with: aMonth of: aYear
	^ self new initializeWith: aMonth of: aYear.! !
