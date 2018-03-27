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

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 3/26/2018 20:56:05'!
+ otroNumero
	^(self next) + otroNumero previous! !

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

II instVarNamed: 'next' put: AnObsoleteIII!
II instVarNamed: 'previous' put: I!

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
