!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:11:05'!
test01gameStartsEmpty

	|game|
	
	game := TicTacToe new.
	
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:11:51'!
test02putXdoesntPutO

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: game Os isEmpty.
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:13:28'!
test03putXandThenO

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	
	self assert: 1 equals: game Xs size.
	self assert: (game Xs includes: 1@1).
	self assert: 1 equals: game Os size.
	self assert: (game Os includes: 2@2).
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:14:21'!
test04cannotPutTwoXsInARow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: game Os isEmpty.
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:24:44'!
test05cannotPutTwoOsInARow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:17:17'!
test06XcannotReusePositionOfX

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:16:54'!
test07XcannotReusePositionOfO

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:17:38'!
test08OcannotReusePositionOfX

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	self
	should: [game putOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert:  game Os isEmpty.

		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:17:55'!
test09OcannotReusePositionOfO

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 3@3.
	self
	should: [game putOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game Xs size.
		self assert: (game Xs includes: 1@1).
		self assert: (game Xs includes: 3@3).
		self assert: 1 equals: game Os size.
		self assert: (game Os includes: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:19:42'!
test10noOneWinsBeforeCompletingThreeMoves

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 3@3.
	
		self deny: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:20:10'!
test11XWinsAfterCompletingFirstRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@3.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:22:03'!
test12XWinsAfterCompletingSecondRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 2@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 2@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:21:29'!
test13XWinsAfterCompletingThirdRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 3@2.
	game putOAt: 2@1.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:22:20'!
test14XWinsAfterCompletingFirstColumn

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	game putXAt: 2@1.
	game putOAt: 3@3.
	game putXAt: 3@1.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:23:55'!
test15XWinsAfterCompletingLeftToRightDiagonal

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 2@3.
	game putXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:23:44'!
test16XWinsAfterCompletingRightToLeftDiagonal

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 2@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:24:49'!
test17OWinsAfterCompletingFirstRow

	|game|
	
	game := TicTacToe new.

	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 2@2.
	game putOAt: 1@2.
	game putXAt: 3@3.
	game putOAt: 1@3.
	
		self assert: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:26:05'!
test18OCannotPlayWhenXHasWon

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 1@1.	
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@1.	
	game putXAt: 1@3.

	self 
		should: [ game putOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:26:31'!
test19XCannotPlayWhenOHasWon

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 1@3.

	self 
		should: [ game putXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:27:10'!
test20GameIsTiedWhenAllPositionsAreUsedAndNoOneWon

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.	
	game putOAt: 2@3.
	game putXAt: 1@2.	
	game putOAt: 3@2.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self deny: game XHasWon. 
	self deny: game OHasWon. 
	self assert: game isTied
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:28:05'!
test21GameIsNotTiedWhenAllPositionsAreUsedAndXHasWon

	| game |
	
	game := TicTacToe new.
	
	game putXAt: 2@2.
	game putOAt: 1@2.	
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	game putXAt: 3@2.	
	game putOAt: 3@1.
	game putXAt: 3@3.
	
	self assert: game isOver.
	self assert: game XHasWon. 
	self deny: game OHasWon. 
	self deny: game isTied
! !


!classDefinition: #State category: #TicTacToStep21!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:16:07'!
canPutO
	self subclassResponsibility .! !

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:16:14'!
canPutX
	self subclassResponsibility .! !

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:31:15'!
hasOWon
	self subclassResponsibility .! !

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:31:11'!
hasXWon
	self subclassResponsibility .! !

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:30:33'!
isGameOver
	self subclassResponsibility .! !

!State methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:30:49'!
isTie
	self subclassResponsibility .! !


!classDefinition: #GameOver category: #TicTacToStep21!
State subclass: #GameOver
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:16:35'!
canPutO
	^ self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage .! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:16:45'!
canPutX
	^ self error: TicTacToe canNotPlayWhenGameIsOverErrorMessage .! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:49:36'!
hasOWon
	^value = #o.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:49:29'!
hasXWon
	^value = #x.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:02:39'!
initializeWith: aWinner
	value:=aWinner .! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:27:21'!
isGameOver
	^true.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 19:50:24'!
isTie
	^value=#tie.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOver class' category: #TicTacToStep21!
GameOver class
	instanceVariableNames: ''!

!GameOver class methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:21:10'!
with: aWinner
	^self new initializeWith: aWinner .! !


!classDefinition: #PlayerTurn category: #TicTacToStep21!
State subclass: #PlayerTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:17:29'!
canPutO
	^ self subclassResponsibility .! !

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:17:38'!
canPutX
	^ self subclassResponsibility .! !

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:26:59'!
hasOWon
	^false.! !

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:27:03'!
hasXWon
	^false.! !

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:27:30'!
isGameOver
	^false.! !

!PlayerTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:26:48'!
isTie
	^false.! !


!classDefinition: #PlayerOTurn category: #TicTacToStep21!
PlayerTurn subclass: #PlayerOTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:16:56'!
canPutO
	! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:22:35'!
canPutX
	^ self error: TicTacToe notXTurnErrorMessage .! !


!classDefinition: #PlayerXTurn category: #TicTacToStep21!
PlayerTurn subclass: #PlayerXTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:22:26'!
canPutO
	^ self error: TicTacToe notOTurnErrorMessage ! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 20:18:19'!
canPutX! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:06:07'!
OHasWon
	
	^state hasOWon .! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:06:14'!
XHasWon
	
	^state hasXWon ! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:06:31'!
checkIfGameIsOverOrUpdateTo: aState
	(self hasWin: os) ifTrue: [ ^state :=  GameOver with: #o ].
	(self hasWin: xs) ifTrue: [ ^state :=  GameOver with: #x ].
	(xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]]) ifTrue: [ ^state :=  GameOver with: #tie ].
	state := aState! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/24/2018 21:05:40'!
hasComplete: positions col: aCol
	^(positions count: [:position | position y = aCol ]) = 3.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/24/2018 21:05:29'!
hasComplete: positions row: aRow
	^ (positions count: [:position | position x = aRow ]) = 3.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/24/2018 21:27:55'!
hasCompleteDiagonal: positions
	^(positions count: [:position | position x = position y]) = 3 or: ((positions count: [:position | (position x + position y) = 4]) = 3)! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:08:03'!
initialize
	
	xs:= Set new.
	os:= Set new.
	
	state := PlayerXTurn new.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:06:47'!
isGameOver
	
	^ state hasXWon or: state hasOWon.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:06:53'!
isOver
	
	^ state isGameOver 
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:07:00'!
isTied
	
	^state isTie.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:07:14'!
putOAt: aPosition
	
	state canPutO.
	self validate: aPosition thenAddTo: os andUpdateTo: PlayerXTurn new.

! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:07:20'!
putXAt: aPosition
	
	state canPutX.

	self validate: aPosition thenAddTo: xs andUpdateTo: PlayerOTurn new.
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 21:02:55'!
validate: aPosition thenAddTo: aPlayersPositions andUpdateTo: aState 
	((xs includes: aPosition) or: (os includes: aPosition )) ifTrue: [^self error: self class positionTakenErrorMessage ].
	aPlayersPositions add: aPosition.
	self checkIfGameIsOverOrUpdateTo: aState.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'CZ 5/24/2018 19:46:49'!
notOTurnErrorMessage
	^'No es el turno de O'.! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !
