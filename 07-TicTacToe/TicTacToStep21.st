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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'CZ 5/28/2018 18:14:11'!
test05cannotPutTwoOsInARow

	|game|
	
	game := TicTacToe new.

	game putXAt: 1@1.
	game putOAt: 2@2.
	self
	should: [game putOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
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


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:21:33'!
OHasWon
	
	^winner = #o! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:21:43'!
XHasWon
	
	^winner = #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

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

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:22:35'!
initialize
	
	xs:= Set new.
	os:= Set new.
	
	turn:= #x.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:17:25'!
isGameOver
	
	^winner = #x or: [ winner = #o ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 15:07:08'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 15:06:57'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] " and: [ self YHasWon not ]]]"! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:16:00'!
putOAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #o ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition.
	(self hasWin: os) ifTrue: [ ^winner := #o ].
	turn := #x
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:23:15'!
putXAt: aPosition

	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #x ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	xs add: aPosition.
	(self hasWin: xs) ifTrue: [ ^winner := #x ].
	turn := #o
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'CZ 5/24/2018 21:32:14'!
canNotPlayWhenGameIsOver
	^'No se pueder jugar si el juego termino.'.! !

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
