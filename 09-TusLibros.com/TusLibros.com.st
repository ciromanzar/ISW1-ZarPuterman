!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'Test' stamp: 'CZ 6/4/2018 21:13:03'!
test01newCartIsEmptyCart
	|cart|
	cart := Cart new.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/4/2018 21:49:11'!
test02aCartWithABookIsNotEmpty
	|cart catalogue|
	catalogue := Catalogue new.
	cart := Cart with: catalogue.
	
	cart add: 1234.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/4/2018 21:45:16'!
test03cannotAddToCartSomethingThatIsNotInTheCatalogue
	|cart|
	cart := Cart new.
	
	self 
		should: [ cart add: (Cart new). ]
		raise: Error
		withExceptionDo: [ :aCart |
			self assert: Cart invalidElementMessageError = aCart messageText ]! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/4/2018 21:39:47'!
test04whenAddingMultipleCopiesOfABookCartIsNotEmpty
	|cart|
	cart := Cart new.
	
	cart add: 2 copiesOf: Book new.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'Test' stamp: 'CZ 6/4/2018 21:38:26'!
test05canAddMultipleCopiesOfABook
	|cart|
	cart := Cart new.
	
	cart add: 2 copiesOf: Book new.
	
	self assert: (cart size = 2).! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'Accesing' stamp: 'CZ 6/4/2018 21:18:02'!
isEmpty
	^elements isEmpty .! !


!Cart methodsFor: 'Modifying' stamp: 'CZ 6/4/2018 21:44:40'!
add: aBookCode
	elements add: aBookCode.! !


!Cart methodsFor: 'initialization' stamp: 'CZ 6/4/2018 21:17:26'!
initialize
	elements := OrderedCollection  new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error' stamp: 'CZ 6/4/2018 21:24:06'!
invalidElementMessageError
	^'Solo se pueden agregar libros al carrito'! !


!classDefinition: #Catalogue category: #'TusLibros.com'!
Object subclass: #Catalogue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!
