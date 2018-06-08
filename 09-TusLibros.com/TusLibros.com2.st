!classDefinition: #TusLibrosTest category: #'TusLibros.com'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!TusLibrosTest methodsFor: 'test support' stamp: 'CZ 6/7/2018 21:32:17'!
createCreditCardWithExpirationOn012018
	^CreditCard with: (Date newDay: 01 month: 01 year: 2018).! !

!TusLibrosTest methodsFor: 'test support' stamp: 'CZ 6/7/2018 21:23:13'!
createCreditCardWithExpirationOn012019
	^CreditCard with: (Date newDay: 01 month: 01 year: 2019).! !

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

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:31:36'!
test01cannotCheckoutEmptyCart
	| cashier cart today creditCard|
	cashier := Cashier new.
	creditCard := self createCreditCardWithExpirationOn012019.
	today := Date newDay: 07 month: 06 year: 2018.
	
	cart := self createEmptyCart .
	self 
		should: [ cashier checkout: cart with: creditCard on: today]
		raise: Error
		withExceptionDo: [ :aCashier |
			self assert: Cashier cannotCheckoutEmptyCartErrorMessage  = aCashier messageText ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:33:35'!
test02cannotCheckoutWithExpiredCreditCard
	| cashier cart today creditCard|
	cashier := Cashier new.
	creditCard := self createCreditCardWithExpirationOn012018.
	today := Date newDay: 07 month: 06 year: 2018.
	
	cart := self createCartWithElPrincipitoPriced10AndElAlephPriced20 .
	self 
		should: [ cashier checkout: cart with: creditCard on: today]
		raise: Error
		withExceptionDo: [ :aCashier |
			self assert: Cashier cannotCheckoutWithExpiredCreditCardErrorMessage  = aCashier messageText ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:39:22'!
test03checkoutACartWithAnElementReturnsElementPrice
	| cashier cart today creditCard|
	cashier := Cashier new.
	creditCard := self createCreditCardWithExpirationOn012018.
	today := Date newDay: 07 month: 06 year: 2018.
	
	cart := self createCartWithElPrincipitoPriced10 .
	self assert: (cashier checkout: cart with: creditCard on: today) = 10.! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cashier methodsFor: 'asserting' stamp: 'CZ 6/7/2018 21:37:14'!
assert: aCreditCard isNotExpiredOn: aDate.
	(aCreditCard expirationDate > aDate) ifFalse: [self error: self class cannotCheckoutWithExpiredCreditCardErrorMessage]. ! !

!Cashier methodsFor: 'asserting' stamp: 'CZ 6/7/2018 21:30:06'!
assertIsNotEmpty: aCart
	(aCart isEmpty) ifTrue: [self error: self class cannotCheckoutEmptyCartErrorMessage]. ! !


!Cashier methodsFor: 'checkout' stamp: 'CZ 6/7/2018 21:26:09'!
checkout: aCart with: aCreditCard on: aDate
	self assertIsNotEmpty: aCart.
	self assert: aCreditCard isNotExpiredOn: aDate.
	
	^aCart totalAmount.! !

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


!classDefinition: #CreditCard category: #'TusLibros.com'!
Object subclass: #CreditCard
	instanceVariableNames: 'expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CreditCard methodsFor: 'accesing' stamp: 'CZ 6/7/2018 21:35:30'!
expirationDate
	^expirationDate .! !


!CreditCard methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:14:58'!
with: anExpirationDate 
	expirationDate := anExpirationDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros.com'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'CZ 6/7/2018 21:15:08'!
with: anExpirationDate
	^ self new with: anExpirationDate .! !
