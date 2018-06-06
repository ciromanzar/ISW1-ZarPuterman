!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 14:51:33'!
test01newCartIsEmptyCart
	|cart|
	cart := Cart with: Catalogue new.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 14:37:19'!
test02aCartWithABookIsNotEmpty
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: 1234.
	cart := Cart with: catalogue.
	
	cart add: 1234.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 14:40:29'!
test03cannotAddToCartSomethingThatIsNotInTheCatalogue
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: 1234.
	cart := Cart with: catalogue.
	self 
		should: [ cart add: (Cart new). ]
		raise: Error
		withExceptionDo: [ :aCart |
			self assert: Cart invalidElementMessageError = aCart messageText ]! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 14:53:09'!
test04canAddMultipleCopiesOfABook
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	cart := Cart with: catalogue.
	
	cart add: 2 copiesOf: '1234'.
	
	self assert: (cart size = 2).! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:05:27'!
test05canAddMoreThanOneBook
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	catalogue add: '5678'.
	cart := Cart with: catalogue.
	
	cart add: 1 copiesOf: '1234'.
	cart add: 1 copiesOf: '5678'.

	self assert: (cart size = 2).! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:05:47'!
test06aCartKnowsTheAmountOfCopiesOfABookThatItContains
	| cart catalogue |
	catalogue _ Catalogue new.
	catalogue add: '1234'.
	catalogue add: '5678'.
	cart _ Cart with: catalogue.
	cart
		add: 2
		copiesOf: '1234'.
	cart add: '5678'.
	self assert: cart size = 3.
	self assert: (cart copiesOf: '1234') = 2.
	self assert: (cart copiesOf: '5678') = 1.! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:05:58'!
test07aCartContainsZeroOfCopiesOfABookThatItDoesntContain
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	catalogue add: '5678'.
	cart := Cart with: catalogue.
	
	cart add: 2 copiesOf: '1234'.
		
	self assert: ((cart copiesOf: '5678') = 0).! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:08:34'!
test08aBookCanBeRemovedFromACart
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	cart := Cart with: catalogue.
	
	cart add: '1234'.
	
	self deny: (cart isEmpty).
	
	cart removeAllCopiesOf: '1234'.
	
	self assert: cart isEmpty .! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:12:25'!
test09aBookThatIsNotInTheCartCanotBeRemovedFromACart
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	cart := Cart with: catalogue.
	
	cart add: '1234'.
	
	
	
	self 
		should: [cart removeAllCopiesOf: '5678'. ]
		raise: Error
		withExceptionDo: [ :aCart |
			self assert: Cart removingInexistentElementMessageError = aCart messageText ]! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:57:01'!
test10SomeCopiesOfABookCanBeRemovedFromACart
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	cart := Cart with: catalogue.
	
	cart add: 2 copiesOf: '1234'.
	
	self assert: (cart size = 2) .
	
	cart remove: 1 copiesOf: '1234'.
	
	self assert: (cart size = 1) .! !

!CartTest methodsFor: 'Test' stamp: 'lp 6/6/2018 15:54:46'!
test11CannotRemoveMoreThanContainedInCart
	|cart catalogue|
	catalogue := Catalogue new.
	catalogue add: '1234'.
	cart := Cart with: catalogue.
	
	cart add: 2 copiesOf: '1234'.
	
	self 
		should: [ cart remove: 3 copiesOf: '1234'.]
		raise: Error
		withExceptionDo: [ :aCart |
			self assert: Cart cannotRemoveMoreElementsThatContainedInCartMessageError = aCart messageText ]! !


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


!Cart methodsFor: 'adding' stamp: 'lp 6/6/2018 14:45:22'!
add: aBookCode
	self add: 1 copiesOf: aBookCode.! !

!Cart methodsFor: 'adding' stamp: 'lp 6/6/2018 15:51:41'!
add: anAmount copiesOf: aBookCode
	self assertABookCodeIsInCatalogue: aBookCode .
	1 to: anAmount do: [:aNumber | elements add: aBookCode].! !


!Cart methodsFor: 'removing' stamp: 'lp 6/6/2018 15:56:19'!
remove: anAmount copiesOf: aBookCode
	|copies|
	self assertABookCodeIsInCart: aBookCode.
	copies := (elements select: [:anElem | anElem = aBookCode]) size.
	
	(copies - anAmount  >= 0) ifFalse:  [ self error: self class cannotRemoveMoreElementsThatContainedInCartMessageError ].
	
	self removeAllCopiesOf: aBookCode.
	self add: (copies - anAmount) copiesOf: aBookCode.
! !

!Cart methodsFor: 'removing' stamp: 'lp 6/6/2018 15:39:55'!
removeAllCopiesOf: aBookCode
	self assertABookCodeIsInCart: aBookCode.
	elements := elements select: [:anElem | anElem ~= aBookCode].
! !


!Cart methodsFor: 'initialization' stamp: 'lp 6/6/2018 15:32:13'!
initializeWith: aCatalogue
	catalogue := aCatalogue.
	elements := OrderedCollection  new.! !


!Cart methodsFor: 'asserting - private' stamp: 'lp 6/6/2018 15:34:19'!
assertABookCodeIsInCart: aBookCode
	(elements includes: aBookCode) ifFalse: [self error: self class removingInexistentElementMessageError] .
! !

!Cart methodsFor: 'asserting - private' stamp: 'lp 6/6/2018 15:25:52'!
assertABookCodeIsInCatalogue: aBookCode

	(catalogue contains: aBookCode) ifFalse: [ self error: self class invalidElementMessageError ].! !

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

!Cart class methodsFor: 'error' stamp: 'lp 6/6/2018 15:10:55'!
removingInexistentElementMessageError
	^'Solo se pueden eliminar libros que esten en el carrito'! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'lp 6/6/2018 14:28:06'!
with: aCatalogue
	^ self new initializeWith: aCatalogue.! !


!classDefinition: #Catalogue category: #'TusLibros.com'!
Object subclass: #Catalogue
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Catalogue methodsFor: 'initialization' stamp: 'lp 6/6/2018 14:33:35'!
initialize
	elements := Set new.! !


!Catalogue methodsFor: 'adding' stamp: 'lp 6/6/2018 14:34:25'!
add: aBookCode
	elements add: aBookCode .! !


!Catalogue methodsFor: 'accesing' stamp: 'lp 6/6/2018 14:36:32'!
contains: aBookCode
	^ elements includes: aBookCode.! !
