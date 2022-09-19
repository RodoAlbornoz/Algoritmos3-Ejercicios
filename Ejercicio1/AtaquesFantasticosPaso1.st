!classDefinition: #Arthas category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Arthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arthas class' category: 'AtaquesFantasticosPaso1'!
Arthas class
	instanceVariableNames: ''!

!Arthas class methodsFor: 'as yet unclassified' stamp: 'RA 9/6/2022 00:13:39'!
atacarA: combatienteASerAtacado
	combatienteASerAtacado recibiUnPuñetazo.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'RA 9/6/2022 00:19:22'!
usarEspada
	| poseeEspada |
	poseeEspada := True
	^poseeEspada! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'RA 9/6/2022 00:19:08'!
usarHacha
	| poseeHacha |
	poseeHacha := True
	^poseeHacha! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso1'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'RA 9/5/2022 17:05:49'!
combatienteHumanoArthas
	^Arthas! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'SF 8/27/2022 06:09:57'!
combatienteOrcoMankrik
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'RA 9/5/2022 17:06:51'!
combatienteOrcoOlgra
	^Olgra! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'RA 9/5/2022 18:01:40'!
comenzarUnNuevoCombate
	self combatienteOrcoOlgra poneTuVidaEn20! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !


!classDefinition: #Olgra category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'AtaquesFantasticosPaso1'!
Olgra class
	instanceVariableNames: 'puntosDeVida'!

!Olgra class methodsFor: 'as yet unclassified' stamp: 'RA 9/5/2022 18:14:50'!
poneTuVidaEn20
	puntosDeVida := 20! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'RA 9/5/2022 23:32:30'!
puntosDeVida
	^puntosDeVida.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'RA 9/6/2022 00:14:24'!
recibiUnEspadazo
	puntosDeVida := puntosDeVida - 8.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'RA 9/6/2022 00:00:05'!
recibiUnHachazo
	puntosDeVida := puntosDeVida - 10! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'RA 9/5/2022 17:50:17'!
recibiUnPuñetazo
	puntosDeVida := puntosDeVida - 2.! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'RA 9/6/2022 00:20:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.! !

Olgra initializeAfterFileIn!