!classDefinition: #TicTacToeConsoleTest category: #TicTacToe!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: 'game console'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsoleTest methodsFor: 'assertions' stamp: 'lp 6/3/2018 17:49:39'!
assert: lines PrintsOAt: aPosition inMove: aMoveNumber
	self assert: (lines at: aMoveNumber*2 - 1) = ('O marc� en ', aPosition printString).
	self assert: (lines at: aMoveNumber*2) =  'Estado: Jugando X'.! !

!TicTacToeConsoleTest methodsFor: 'assertions' stamp: 'lp 6/3/2018 17:49:58'!
assert: lines PrintsOWinsAt: aPosition inMove: aMoveNumber
	self assert: (lines at: aMoveNumber*2 - 1) = ('O marc� en ', aPosition printString).
	self assert: (lines at: aMoveNumber*2) =  'Estado: Juego terminado - Gan� O!!'.! !

!TicTacToeConsoleTest methodsFor: 'assertions' stamp: 'lp 6/3/2018 18:02:30'!
assert: lines PrintsTieAt: aPosition inMove: aMoveNumber
	self assert: (lines at: aMoveNumber*2 - 1) = ('X marc� en ', aPosition printString).
	self assert: (lines at: aMoveNumber*2) =  'Estado: Juego terminado - Empate!!'.! !

!TicTacToeConsoleTest methodsFor: 'assertions' stamp: 'lp 6/3/2018 17:50:13'!
assert: lines PrintsXAt: aPosition inMove: aMoveNumber
	self assert: (lines at: aMoveNumber*2 - 1) = ('X marc� en ', aPosition printString).
	self assert: (lines at: aMoveNumber*2) =  'Estado: Jugando O'.! !

!TicTacToeConsoleTest methodsFor: 'assertions' stamp: 'lp 6/3/2018 17:50:31'!
assert: lines PrintsXWinsAt: aPosition inMove: aMoveNumber
	self assert: (lines at: aMoveNumber*2 - 1) = ('X marc� en ', aPosition printString).
	self assert: (lines at: aMoveNumber*2) =  'Estado: Juego terminado - Gan� X!!'.! !


!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:53:40'!
test01GameStartsConsolePrintsNothing

	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	lines := console lines.
	
	self assert: lines isEmpty 
	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:50:47'!
test02XPlaysConsolePrintsActionAndState

	|lines|
	
	game _ TicTacToe new.
		
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 2@2.
	
	lines := console lines.

	self assert: lines PrintsXAt: 2@2 inMove: 1.

	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:51:08'!
test03OPlaysConsolePrintsActionAndState
	
	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	
	lines := console lines.
	
	self assert: lines PrintsXAt: 2@2 inMove: 1.
	self assert: lines PrintsOAt: 1@1 inMove: 2.

	
	


	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:51:33'!
test04XPlaysForSecondTimeConsolePrintsActionAndState

	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	
	lines := console lines.
	
	self assert: lines PrintsXAt: 2@2 inMove: 1.
	self assert: lines PrintsOAt: 1@1 inMove: 2.
	self assert: lines PrintsXAt: 1@3 inMove: 3.


	
	


	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:52:08'!
test05XWinsConsolePrintsActionAndState

	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.
	
	lines := console lines.
	
	self assert: lines PrintsXAt: 2@2 inMove: 1.
	self assert: lines PrintsOAt: 1@1 inMove: 2.
	self assert: lines PrintsXAt: 1@3 inMove: 3.
	self assert: lines PrintsOAt: 1@2 inMove: 4.
	self assert: lines PrintsXWinsAt: 3@1 inMove: 5.



	
	


	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 17:54:47'!
test06OWinsConsolePrintsActionAndState
	
	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 3@1.
	game markWithXAt: 1@2.
	game markWithOAt: 2@1.
	
	lines := console lines.
	
	self assert: lines PrintsXAt: 2@2 inMove: 1.
	self assert: lines PrintsOAt: 1@1 inMove: 2.
	self assert: lines PrintsXAt: 1@3 inMove: 3.
	self assert: lines PrintsOAt: 3@1 inMove: 4.
	self assert: lines PrintsXAt:  1@2 inMove: 5.
	self assert: lines PrintsOWinsAt: 2@1 inMove: 6.



	
	


	! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'lp 6/3/2018 18:03:34'!
test07TieConsolePrintsActionAndState
	
	|lines|
	
	game _ TicTacToe new.
	
	console _ TicTacToeConsole for: game.
	
	game markWithXAt: 1@3.
	game markWithOAt: 2@3.
	game markWithXAt: 3@3.	
	game markWithOAt: 1@1.
	game markWithXAt: 2@1.
	game markWithOAt: 3@1.
	game markWithXAt: 1@2.
	game markWithOAt: 2@2.
	game markWithXAt: 3@2.
	
	lines := console lines.
	
	self assert: lines PrintsXAt: 1@3 inMove: 1.
	self assert: lines PrintsOAt: 2@3 inMove: 2.
	self assert: lines PrintsXAt: 3@3 inMove: 3.
	self assert: lines PrintsOAt: 1@1 inMove: 4.
	self assert: lines PrintsXAt:  2@1 inMove: 5.
	self assert: lines PrintsOAt: 3@1 inMove: 6.
	self assert: lines PrintsXAt: 1@2 inMove: 7.
	self assert: lines PrintsOAt: 2@2 inMove: 8.
	self assert: lines PrintsTieAt:  3@2 inMove: 9.



	
	


	! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToeVisorTest category: #TicTacToe!
TestCase subclass: #TicTacToeVisorTest
	instanceVariableNames: 'game visor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:27:53'!
test01GameStartsVisorPrintsEmptyBoardAndXPlaying

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	lines := visor lines.
	
	self assertIsEmptyRow: (lines at: 1).
	self assertIsSeparatorRow: (lines at: 2). 
	self assertIsEmptyRow: (lines at: 3). 
	self assertIsSeparatorRow: (lines at: 4). 
	self assertIsEmptyRow: (lines at: 5).
	self assertThat: (lines at: 6) showsThatIsPlaying: 'X'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:21:38'!
test02XPlaysVisorPrintsXInPosittionAnd0Playing

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 2@2.
	
	lines := visor lines.
	
	self assertIsEmptyRow: (lines at: 1).
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = ' |X| '. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assertIsEmptyRow: (lines at: 5).
	self assertThat: (lines at: 6) showsThatIsPlaying: 'O'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:27:20'!
test03OPlaysVisorPrintsOInPositionAndXPlaying

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	
	lines := visor lines.
	
	self assertIsEmptyRow: (lines at: 1).
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = ' |X| '. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assert: (lines at: 5) = 'O| | '. 
	self assertThat: (lines at: 6) showsThatIsPlaying: 'X'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:26:31'!
test04XPlaysSecondMoveVisorPrintsXInPositionAndOPlaying

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	
	lines := visor lines.
	
	self assert: (lines at: 1) = 'X| | '.
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = ' |X| '. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assert: (lines at: 5) = 'O| | '. 
	self assertThat: (lines at: 6) showsThatIsPlaying: 'O'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:31:52'!
test05XwinsVisorPrintsBoardAndState

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.
	
	lines := visor lines.
	
	self assert: (lines at: 1) = 'X| | '.
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = 'O|X| '. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assert: (lines at: 5) = 'O| |X'. 
	self assertThat:   (lines at: 6) showsThatTheWinnerIs: 'X'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:33:12'!
test06OwinsVisorPrintsBoardAndState

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 3@1.
	game markWithXAt: 1@2.
	game markWithOAt: 2@1.
	
	lines := visor lines.
	
	self assert: (lines at: 1) = 'X| | '.
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = 'X|X| '. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assert: (lines at: 5) = 'O|O|O'. 
	self assertThat:   (lines at: 6) showsThatTheWinnerIs: 'O'.
! !

!TicTacToeVisorTest methodsFor: 'Testing' stamp: 'lp 6/3/2018 17:44:51'!
test07GameEndsInTieVisorPrintsBoardAndState

	|lines|
	
	game _ TicTacToe new.
	
	visor _ TicTacToeVisor for: game.
	
	game markWithXAt: 1@3.
	game markWithOAt: 2@3.
	game markWithXAt: 3@3.
	
	game markWithOAt: 1@1.
	game markWithXAt: 2@1.
	game markWithOAt: 3@1.

	game markWithXAt: 1@2.
	game markWithOAt: 2@2.
	game markWithXAt: 3@2.
	
	lines := visor lines.
	
	self assert: (lines at: 1) = 'X|O|X'.
	self assertIsSeparatorRow: (lines at: 2). 
	self assert: (lines at: 3) = 'X|O|X'. 
	self assertIsSeparatorRow: (lines at: 4). 
	self assert: (lines at: 5) = 'O|X|O'. 
	self assert:(lines at: 6) = 'Tie !!'.
! !


!TicTacToeVisorTest methodsFor: 'asserts' stamp: 'lp 6/3/2018 16:25:52'!
assertIsEmptyRow: aVisorRow
	self assert: aVisorRow = ' | | '.! !

!TicTacToeVisorTest methodsFor: 'asserts' stamp: 'lp 6/3/2018 16:26:35'!
assertIsSeparatorRow: aVisorRow
	self assert: aVisorRow = '-----'.! !

!TicTacToeVisorTest methodsFor: 'asserts' stamp: 'lp 6/3/2018 16:29:32'!
assertThat: aVisorRow showsThatIsPlaying: aPlayer
	self assert: aVisorRow = ('Playing ', aPlayer) .! !

!TicTacToeVisorTest methodsFor: 'asserts' stamp: 'lp 6/3/2018 17:31:31'!
assertThat: aVisorRow showsThatTheWinnerIs: aPlayer
	self assert: aVisorRow = (aPlayer, ' won !!') .! !


!classDefinition: #Observable category: #TicTacToe!
Object subclass: #Observable
	instanceVariableNames: 'observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Observable methodsFor: 'initialization' stamp: 'lp 5/31/2018 19:26:57'!
initialize
	observers _ OrderedCollection new.
	! !


!Observable methodsFor: 'attatchment' stamp: 'lp 5/31/2018 19:27:42'!
attatch: anObserver
	observers add: anObserver.! !


!Observable methodsFor: 'notification' stamp: 'lp 5/31/2018 19:49:35'!
notifyAllObserversWith: aPosition
	observers collect: [:anObserver | anObserver updateWith: aPosition].! !


!classDefinition: #TicTacToe category: #TicTacToe!
Observable subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'lp 5/31/2018 19:56:37'!
initialize
	super initialize .
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'lp 5/31/2018 20:05:18'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.
	
	self notifyAllObserversWith: aPosition .! !

!TicTacToe methodsFor: 'marking board' stamp: 'lp 5/31/2018 20:00:16'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.
	
	self notifyAllObserversWith: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JG 5/12/2018 12:34:04'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #Observer category: #TicTacToe!
Object subclass: #Observer
	instanceVariableNames: 'observed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Observer methodsFor: 'update' stamp: 'lp 5/31/2018 19:50:34'!
updateWith: aPosition
	self subclassResponsibility ! !


!Observer methodsFor: 'initialization' stamp: 'lp 5/31/2018 20:00:05'!
initializeWith: anObservable.
	observed := anObservable .
	observed attatch: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Observer class' category: #TicTacToe!
Observer class
	instanceVariableNames: ''!

!Observer class methodsFor: 'as yet unclassified' stamp: 'lp 5/31/2018 19:33:16'!
for: anObservable
	^ self new initializeWith: anObservable.! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
Observer subclass: #TicTacToeConsole
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'initialization' stamp: 'lp 5/31/2018 19:53:25'!
initializeWith: aTicTacToe
	super initializeWith: aTicTacToe .
	lines := OrderedCollection new.! !

!TicTacToeConsole methodsFor: 'initialization' stamp: 'lp 5/31/2018 19:34:17'!
lines
	^ lines copy! !


!TicTacToeConsole methodsFor: 'update' stamp: 'lp 6/4/2018 13:05:50'!
updateWith: aPosition
	| lastPlayer currentPlayer state|
	
	"Decidimos dejar estos ifs ya que no nos parece correcto agregar mensajes en los estados que interactuen con los observers ya que los objetos observados no deberian 
	saber que estan siendo observados ni modificar su comportamiento. Al anadir comportamiento especifico en los estados se estaria perdiendo el sentido de los observadores
	que es mirar al objeto observado y realizar acciones sin que este lo sepa."
	
	state := 'Estado: '.
	observed isOver ifTrue: [
		state := state, 'Juego terminado - '.
		observed hasPlayerOWon ifTrue: [lastPlayer := 'O'. state := state, 'Gan� O!!'.] 
									    ifFalse: [observed isTied ifTrue:[state:= state, 'Empate!!'.] 
																	ifFalse:[state := state, 'Gan� X!!'.].
												lastPlayer := 'X'.].]
						 ifFalse: [observed isPlayingX ifTrue: [currentPlayer := 'X'. lastPlayer := 'O']
														    ifFalse: [lastPlayer := 'X'. currentPlayer := 'O']. state := state, 'Jugando ', currentPlayer . ].
	
	
	lines add: lastPlayer, ' marc� en ', aPosition printString.
	lines add: state.
	! !


!classDefinition: #TicTacToeVisor category: #TicTacToe!
Observer subclass: #TicTacToeVisor
	instanceVariableNames: 'positions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeVisor methodsFor: 'initialization' stamp: 'lp 6/3/2018 16:15:34'!
initializeWith: aTicTacToe
	super initializeWith: aTicTacToe .
	positions := OrderedCollection new.
	1 to: 9 do: [:x | positions add: ' '].! !


!TicTacToeVisor methodsFor: 'update' stamp: 'lp 6/4/2018 13:05:42'!
updateWith: aPosition
	| lastPlayer|
	
	"Decidimos dejar estos ifs ya que no nos parece correcto agregar mensajes en los estados que interactuen con los observers ya que los objetos observados no deberian 
	saber que estan siendo observados ni modificar su comportamiento. Al anadir comportamiento especifico en los estados se estaria perdiendo el sentido de los observadores
	que es mirar al objeto observado y realizar acciones sin que este lo sepa."
	observed isOver ifTrue: [
		observed hasPlayerOWon ifTrue: [lastPlayer := 'O'] ifFalse: [lastPlayer := 'X'].
		] ifFalse: [observed isPlayingX ifTrue: [lastPlayer := 'O'] ifFalse: [lastPlayer := 'X'. ].].
	
	positions at: ((aPosition x -1) * 3 + aPosition y ) put: lastPlayer.! !


!TicTacToeVisor methodsFor: 'as yet unclassified' stamp: 'lp 6/3/2018 16:48:18'!
lines
	|visualTicTacToe currentPlayer|
	visualTicTacToe  := OrderedCollection new.
	visualTicTacToe  add: (self printRow: 1).
	visualTicTacToe  add: (self printRowSeparator ).
	visualTicTacToe  add: (self printRow: 2).
	visualTicTacToe  add: (self printRowSeparator ).
	visualTicTacToe  add: (self printRow: 3).
	
	observed isPlayingX ifTrue: [currentPlayer := 'X'] ifFalse: [currentPlayer := 'O'].
		
	visualTicTacToe add: (observed isOver  
	ifTrue: [observed hasPlayerXWon  
		ifTrue: ['X won !!'] 
		ifFalse: [observed hasPlayerOWon 
				ifTrue: ['O won !!'] 
				ifFalse: ['Tie !!']
				]
		]
	ifFalse: ['Playing ', currentPlayer ]).
	
	^visualTicTacToe
	! !

!TicTacToeVisor methodsFor: 'as yet unclassified' stamp: 'lp 6/3/2018 17:16:10'!
printRow: aRowNumber
	|index|
	index := aRowNumber*-1 + 4.
	^ (positions at: index) , '|',  (positions at: (index + 3))  , '|', (positions at: (index + 6)).! !

!TicTacToeVisor methodsFor: 'as yet unclassified' stamp: 'lp 5/31/2018 20:54:25'!
printRowSeparator
	^ '-----'.! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !
