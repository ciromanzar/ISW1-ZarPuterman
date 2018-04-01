!classDefinition: #I category: #'Quinta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Quinta Actividad'!
I class
	instanceVariableNames: 'next previous'!

!I class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:26:35'!
* otroNumero
	^ otroNumero! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 3/28/2018 18:11:27'!
+ otroNumero
	^ otroNumero next! !

!I class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 23:54:08'!
- otroNumero
	^ self error: 'descripcionDeErrorDeNumerosNegativosNoSoportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:11'!
next 
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:24'!
previous
	^self error:'no existe'! !

I instVarNamed: 'next' put: nil!
I instVarNamed: 'previous' put: nil!

!classDefinition: #II category: #'Quinta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Quinta Actividad'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:22'!
* otroNumero
	^ self previous * (otroNumero + otroNumero)! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 3/28/2018 18:11:11'!
+ otroNumero
	^self previous + otroNumero next! !

!II class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 10:39:07'!
- otroNumero
	^ otroNumero name  ~= 'I' ifTrue:[
		^self previous - otroNumero previous
		]ifFalse:[^self previous].
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:54:21'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		
	].
	^next

	
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:39'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:52'!
previous: otroNumero
	^previous := otroNumero! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Quinta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Quinta Actividad'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:37'!
* otroNumero
	^ self previous * (otroNumero + otroNumero)! !

!III class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:37'!
+ otroNumero
	^self previous + otroNumero next! !

!III class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 10:38:56'!
- otroNumero
	^ otroNumero name  ~= 'I' ifTrue:[
		^self previous - otroNumero previous
		]ifFalse:[^self previous].! !

!III class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:37'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		
	].
	^next

	
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:37'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:37'!
previous: otroNumero
	^previous := otroNumero! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Quinta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Quinta Actividad'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:41'!
* otroNumero
	^ self previous * (otroNumero + otroNumero)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:41'!
+ otroNumero
	^self previous + otroNumero next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 10:39:02'!
- otroNumero
	^ otroNumero name  ~= 'I' ifTrue:[
		^self previous - otroNumero previous
		]ifFalse:[^self previous].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:41'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		
	].
	^next

	
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:41'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'lp 3/31/2018 17:27:41'!
previous: otroNumero
	^previous := otroNumero! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'previous' put: III!

!classDefinition: #PeanoTest category: #'Quinta Actividad'!
DenotativeObject subclass: #PeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Quinta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PeanoTest class' category: #'Quinta Actividad'!
PeanoTest class
	instanceVariableNames: ''!

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:26'!
test01UnoMasUnSumandoEsElProximoDelSumando

	Assert that: I + II isEqualTo: II next.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:11:40'!
test02NumerosMayoresaUnoSumanBien

	Assert that: II + II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:12:19'!
test03UnNumeroMenosUnoEsElPrevioDelNumero

	Assert that: II - I isEqualTo: II previous.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:11'!
test04NumerosMayoresaUnoRestanBien

	Assert that: IIII - II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:02'!
test05RestaNoSoportaNumerosNegativos

	Assert should: [ I - II ] signal: Error withDescription: I descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:53'!
test06UnNumeroMultiplicadoPorUnoEsIgualAlNumero

	Assert that: II * I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:23'!
test07NumerosMayoresaUnoMultiplicanBien

	Assert that: II * II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:46'!
test08UnoMultiplicadoUnoEsIgualAUno

	Assert that: I * I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:01:58'!
test09NumerosMayoresaUnoDividenBien

	Assert that: IIII / II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:28'!
test10UnNumeroDivididoUnoEsIgualAlNumero

	Assert that: II / I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:38'!
test11UnoDivididoUnoEsIgualAUno

	Assert that: I / I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:59'!
test12DivisionNoSoportaDividirPorUnNumeroMayor

	Assert should: [ III /  IIII ] signal: Error withDescription: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	
	Assert should: [ I /  II] signal: Error withDescription: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
! !
