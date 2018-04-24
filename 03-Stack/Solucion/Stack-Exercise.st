!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'lp 4/23/2018 20:44:17'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.

	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'lp 4/23/2018 21:09:09'!
test11SizeReturnsActualSize

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	self assert: stack size = 0.

	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	
	stack pop.
	
	self assert: stack size = 0.
	
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: stack size = 0. ]
	

	! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:02:56'!
initialize
	head := OOStackEmptyElement new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:39:36'!
isEmpty
	^size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:59:47'!
pop
	|value|
	value := head value: self.
	head := head next.
	size := size -1.
	^value.
	
	
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:02:28'!
push: anObject
	head := OOStackNotEmptyElement withValue: anObject andNext: head.
	size := size +1.
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:41:55'!
size
	^size.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:59:42'!
top
	^head value: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'elem'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:35:39'!
next
self subclassResponsibility ! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:34:55'!
value
self subclassResponsibility ! !


!classDefinition: #OOStackEmptyElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackEmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmptyElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:35:55'!
next
self value! !

!OOStackEmptyElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:00:06'!
value: aStack
	aStack error: aStack class stackEmptyErrorDescription! !


!classDefinition: #OOStackNotEmptyElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackNotEmptyElement
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmptyElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:00:59'!
initializeWithValue: aValue andNext: aStackElement
	value := aValue.
	next := aStackElement.! !

!OOStackNotEmptyElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 20:36:20'!
next
	^ next! !

!OOStackNotEmptyElement methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:00:23'!
value: aStack
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmptyElement class' category: #'Stack-Exercise'!
OOStackNotEmptyElement class
	instanceVariableNames: ''!

!OOStackNotEmptyElement class methodsFor: 'as yet unclassified' stamp: 'lp 4/23/2018 21:01:19'!
withValue: aValue andNext: aStackElement
	^ self new initializeWithValue: aValue andNext: aStackElement! !
