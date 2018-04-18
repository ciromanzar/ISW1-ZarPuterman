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

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:50:19'!
- otroNumero
	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:50:10'!
/ otroNumero
	(self isEqualTo: otroNumero) ifTrue: 
	[
		^ I.
	].
	^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:47:18'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir or un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:44:45'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	'Numeros negativos no soportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 17:41:06'!
esMayorIgualA: otroNumero
	^ self isEqualTo: otroNumero.! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:11'!
next 
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'CZ 3/22/2018 21:46:24'!
previous
	^self error:'no existe'! !

!I class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 11:02:26'!
restar: otroNumero
	^otroNumero previous! !

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

!II class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 11:04:48'!
- otroNumero
	^otroNumero restar: self
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:50:26'!
/ otroNumero
	(self esMayorIgualA: otroNumero) ifTrue:
	[
		(self isEqualTo: otroNumero) ifTrue: 
		[
			^ I
		].
		^ I + ((self - otroNumero) / otroNumero)
	].
		^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
		
		! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:47:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir or un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:06:01'!
esMayorIgualA: otroNumero
	(otroNumero isEqualTo: I) ifTrue:
	[
		^true.
	].
	^(self previous) esMayorIgualA: (otroNumero previous).! !

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

!II class methodsFor: 'as yet unclassified' stamp: 'lp 4/1/2018 11:03:05'!
restar: otroNumero
	^otroNumero previous - previous! !

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

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
* otroNumero
	^ self previous * (otroNumero + otroNumero)! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
+ otroNumero
	^self previous + otroNumero next! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
- otroNumero
	^otroNumero restar: self
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:50:32'!
/ otroNumero
	(self esMayorIgualA: otroNumero) ifTrue:
	[
		(self isEqualTo: otroNumero) ifTrue: 
		[
			^ I
		].
		^ I + ((self - otroNumero) / otroNumero)
	].
		^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
		
		! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir or un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
esMayorIgualA: otroNumero
	(otroNumero isEqualTo: I) ifTrue:
	[
		^true.
	].
	^(self previous) esMayorIgualA: (otroNumero previous).! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		
	].
	^next

	
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
previous: otroNumero
	^previous := otroNumero! !

!III class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:23'!
restar: otroNumero
	^otroNumero previous - previous! !

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

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
* otroNumero
	^ self previous * (otroNumero + otroNumero)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
+ otroNumero
	^self previous + otroNumero next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
- otroNumero
	^otroNumero restar: self
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:50:39'!
/ otroNumero
	(self esMayorIgualA: otroNumero) ifTrue:
	[
		(self isEqualTo: otroNumero) ifTrue: 
		[
			^ I
		].
		^ I + ((self - otroNumero) / otroNumero)
	].
		^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
		
		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir or un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
esMayorIgualA: otroNumero
	(otroNumero isEqualTo: I) ifTrue:
	[
		^true.
	].
	^(self previous) esMayorIgualA: (otroNumero previous).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		
	].
	^next

	
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
previous: otroNumero
	^previous := otroNumero! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'CZ 4/1/2018 18:48:26'!
restar: otroNumero
	^otroNumero previous - previous! !

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
