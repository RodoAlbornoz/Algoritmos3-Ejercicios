!classDefinition: #MarsRoverTests category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverEnElNorte marsRoverEnElSur marsRoverEnElEste marsRoverEnElOeste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTests methodsFor: 'test' stamp: 'AC 11/3/2022 14:31:51'!
test01UnMarsRoverNoCambiaSuDireccionNiPosicionConUnComandoVacio

	self assertMarsRover: marsRoverEnElNorte  respondeA: '' yTerminaEn:  (0@0)  mirandoHacia: self norte.
	
! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:19:27'!
test02UnMarsRoverMirandoHaciaElNorteQuedaMirandoHaciaElOesteAlGirarAIzquierda

	self assertMarsRover: marsRoverEnElNorte  respondeA: 'l' yTerminaEn:  (0@0)  mirandoHacia: self oeste.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:19:40'!
test03UnMarsRoverMirandoHaciaElNorteQuedaMirandoHaciaElEsteAlGirarADerecha

	self assertMarsRover: marsRoverEnElNorte  respondeA: 'r' yTerminaEn:  (0@0)  mirandoHacia: self este.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:20:10'!
test04UnMarsRoverMirandoHaciaElNorteAvanzaEnEsaDireccionAlEnviarComandoHaciaAdelante
	
	self assertMarsRover: marsRoverEnElNorte  respondeA: 'f' yTerminaEn:  (0@1)  mirandoHacia: self norte.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:20:56'!
test05UnMarsRoverMirandoHaciaElNorteRetrocedeHaciaElSurAlEnviarComandoHaciaAtras
	
	self assertMarsRover: marsRoverEnElNorte  respondeA: 'b' yTerminaEn:  (0@-1)  mirandoHacia: self norte.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:21:25'!
test06UnMarsRoverMirandoHaciaElSurQuedaMirandoHaciaElEsteAlGirarAIzquierda

	self assertMarsRover: marsRoverEnElSur  respondeA: 'l' yTerminaEn:  (0@0)  mirandoHacia: self este.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:21:48'!
test07UnMarsRoverMirandoHaciaElSurQuedaMirandoHaciaElOesteAlGirarADerecha
	
	self assertMarsRover: marsRoverEnElSur  respondeA: 'r' yTerminaEn:  (0@0)  mirandoHacia: self oeste.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:24:23'!
test08UnMarsRoverMirandoHaciaElSurAvanzaEnEsaDireccionAlEnviarComandoHaciaAdelante
	
	self assertMarsRover: marsRoverEnElSur  respondeA: 'f' yTerminaEn:  (0@-1)  mirandoHacia: self sur.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:24:54'!
test09UnMarsRoverMirandoHaciaElSurRetrocedeHaciaElNorteAlEnviarComandoHaciaAtras
	
	self assertMarsRover: marsRoverEnElSur  respondeA: 'b' yTerminaEn:  (0@1)  mirandoHacia: self sur.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:22:02'!
test10UnMarsRoverMirandoHaciaElEsteQuedaMirandoHaciaElNorteAlGirarAIzquierda
	
	self assertMarsRover: marsRoverEnElEste respondeA: 'l' yTerminaEn:  (0@0)  mirandoHacia: self norte.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:22:17'!
test11UnMarsRoverMirandoHaciaElEsteQuedaMirandoHaciaElSurAlGirarADerecha
	
	self assertMarsRover: marsRoverEnElEste respondeA: 'r' yTerminaEn:  (0@0)  mirandoHacia: self sur.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:25:05'!
test12UnMarsRoverMirandoHaciaElEsteAvanzaEnEsaDireccionAlEnviarComandoHaciaAdelante

	self assertMarsRover: marsRoverEnElEste respondeA: 'f' yTerminaEn:  (1@0)  mirandoHacia: self este.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:25:34'!
test13UnMarsRoverMirandoHaciaElEsteRetrocedeHaciaElOesteAlEnviarComandoHaciaAtras

	self assertMarsRover: marsRoverEnElEste respondeA: 'b' yTerminaEn:  (-1@0)  mirandoHacia: self este.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:22:33'!
test14UnMarsRoverMirandoHaciaElOesteQuedaMirandoHaciaElSurAlGirarAIzquierda

	self assertMarsRover: marsRoverEnElOeste respondeA: 'l' yTerminaEn:  (0@0)  mirandoHacia: self sur.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:22:47'!
test15UnMarsRoverMirandoHaciaElOesteQuedaMirandoHaciaElNorteAlGirarADerecha

	self assertMarsRover: marsRoverEnElOeste respondeA: 'r' yTerminaEn:  (0@0)  mirandoHacia: self norte.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:25:13'!
test16UnMarsRoverMirandoHaciaElOesteAvanzaEnEsaDireccionAlEnviarComandoHaciaAdelante

	self assertMarsRover: marsRoverEnElOeste respondeA: 'f' yTerminaEn:  (-1@0)  mirandoHacia: self oeste.! !

!MarsRoverTests methodsFor: 'test' stamp: 'RA 11/1/2022 16:25:44'!
test17UnMarsRoverMirandoHaciaElOesteRetrocedeHaciaElEsteAlEnviarComandoHaciaAtras

	self assertMarsRover: marsRoverEnElOeste respondeA: 'b' yTerminaEn:  (1@0)  mirandoHacia: self oeste.! !

!MarsRoverTests methodsFor: 'test' stamp: 'AC 11/3/2022 14:46:22'!
test18UnMarsRoverNoCambiaSuDireccionNiPosicionConUnComandoInvalido

	|marsRover|
	marsRover := MarsRover arrancarEn: (0@0) mirandoHacia: self norte.

	self
		should: [marsRover procesar: 'z']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: MarsRover errorComandoInvalido equals: anError messageText.
			self assert: (marsRover miraHaciaLaDireccion: self norte yEstaEnLaPosicion: (0@0))].! !

!MarsRoverTests methodsFor: 'test' stamp: 'AC 11/3/2022 14:46:22'!
test19UnMarsRoverProcesaSoloLosComandosValidosQueEstanAntesDeUnoInvalido
	
	|marsRover|
	marsRover := MarsRover arrancarEn: (0@0) mirandoHacia: self norte.

	self
		should: [marsRover procesar:'lfrblylbbrr']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: MarsRover errorComandoInvalido equals: anError messageText.
			self assert: (marsRover miraHaciaLaDireccion: self oeste yEstaEnLaPosicion: (-1@-1))].! !


!MarsRoverTests methodsFor: 'direcciones cardinales' stamp: 'AC 10/31/2022 19:10:23'!
este 
	
	^MarsRoverEste.! !

!MarsRoverTests methodsFor: 'direcciones cardinales' stamp: 'AC 10/31/2022 19:09:54'!
norte 
	
	^MarsRoverNorte.! !

!MarsRoverTests methodsFor: 'direcciones cardinales' stamp: 'AC 10/31/2022 19:10:32'!
oeste 
	
	^MarsRoverOeste.! !

!MarsRoverTests methodsFor: 'direcciones cardinales' stamp: 'AC 10/31/2022 19:10:09'!
sur 
	
	^MarsRoverSur.! !


!MarsRoverTests methodsFor: 'setup' stamp: 'RA 11/1/2022 15:54:28'!
setUp

	marsRoverEnElNorte	 := MarsRover arrancarEn: (0@0) mirandoHacia: self norte.
	marsRoverEnElSur := MarsRover arrancarEn: (0@0) mirandoHacia: self sur.
	marsRoverEnElEste := MarsRover arrancarEn: (0@0) mirandoHacia: self este.
	marsRoverEnElOeste := MarsRover arrancarEn: (0@0) mirandoHacia: self oeste.! !


!MarsRoverTests methodsFor: 'private' stamp: 'RA 11/3/2022 16:26:10'!
assertMarsRover: unMarsRover respondeA: unaSerieDeComandos yTerminaEn: unaPosicion mirandoHacia: unaDireccionCardinal

	unMarsRover procesar: unaSerieDeComandos.
	self assert: (unMarsRover miraHaciaLaDireccion: unaDireccionCardinal yEstaEnLaPosicion: unaPosicion).
	! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'public' stamp: 'AC 10/31/2022 19:10:59'!
inicializarEn: unPunto enDireccion: unaDireccionCardinal

	posicion := unPunto.
	direccionCardinal := unaDireccionCardinal for: self.! !

!MarsRover methodsFor: 'public' stamp: 'RA 11/3/2022 16:23:21'!
miraHaciaLaDireccion: unaDireccion yEstaEnLaPosicion: unaPosicion

	^((direccionCardinal class = unaDireccion) and: [unaPosicion = posicion]).
	! !

!MarsRover methodsFor: 'public' stamp: 'AC 10/31/2022 19:29:34'!
procesar: unaSerieDeComandos
	
	unaSerieDeComandos do:[:unComando | self procesarComando: unComando].
	
	! !


!MarsRover methodsFor: 'private' stamp: 'AC 10/31/2022 16:23:01'!
avanzar
	  
	direccionCardinal avanzar.! !

!MarsRover methodsFor: 'private' stamp: 'AC 10/31/2022 16:25:00'!
girarALaDerecha

	direccionCardinal girarALaDerecha.! !

!MarsRover methodsFor: 'private' stamp: 'AC 10/31/2022 16:25:19'!
girarALaIzquierda
	
	direccionCardinal girarALaIzquierda.! !

!MarsRover methodsFor: 'private' stamp: 'RA 11/1/2022 16:38:13'!
procesarComando: unComando
	
	(self esComandoParaAvanzar: unComando) ifTrue: [^self avanzar].
	(self esComandoParaRetroceder: unComando) ifTrue: [^self retroceder].
	(self esComandoParaGirarALaDerecha: unComando) ifTrue: [^self girarALaDerecha].
	(self esComandoParaGirarALaIzquierda: unComando) ifTrue: [^self girarALaIzquierda].
	
	self error: self class errorComandoInvalido.
	
	! !

!MarsRover methodsFor: 'private' stamp: 'AC 10/31/2022 16:23:33'!
retroceder

	direccionCardinal retroceder.! !


!MarsRover methodsFor: 'tipos de comando' stamp: 'AC 10/31/2022 16:07:54'!
esComandoParaAvanzar: unComando

	^ unComando = $f! !

!MarsRover methodsFor: 'tipos de comando' stamp: 'AC 10/31/2022 16:09:07'!
esComandoParaGirarALaDerecha: unComando

	^ unComando = $r! !

!MarsRover methodsFor: 'tipos de comando' stamp: 'AC 10/31/2022 19:19:48'!
esComandoParaGirarALaIzquierda: unComando

	^ unComando = $l! !

!MarsRover methodsFor: 'tipos de comando' stamp: 'AC 10/31/2022 16:08:26'!
esComandoParaRetroceder: unComando

	^ unComando = $b! !


!MarsRover methodsFor: 'movimientos' stamp: 'AC 10/31/2022 18:58:05'!
moverAlEste

	posicion := posicion + (1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'AC 10/31/2022 18:59:07'!
moverAlNorte

	posicion := posicion + (0@1).! !

!MarsRover methodsFor: 'movimientos' stamp: 'AC 10/31/2022 18:58:15'!
moverAlOeste

	posicion := posicion + (-1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'AC 10/31/2022 18:58:54'!
moverAlSur

	posicion := posicion + (0@-1).! !


!MarsRover methodsFor: 'cambio de direccion' stamp: 'AC 10/31/2022 16:20:46'!
dirigirseAlEste

	 direccionCardinal := MarsRoverEste for: self.! !

!MarsRover methodsFor: 'cambio de direccion' stamp: 'AC 10/31/2022 16:20:27'!
dirigirseAlNorte

	 direccionCardinal := MarsRoverNorte for: self.! !

!MarsRover methodsFor: 'cambio de direccion' stamp: 'AC 10/31/2022 16:20:56'!
dirigirseAlOeste

	 direccionCardinal := MarsRoverOeste for: self.! !

!MarsRover methodsFor: 'cambio de direccion' stamp: 'AC 10/31/2022 16:20:37'!
dirigirseAlSur

	 direccionCardinal := MarsRoverSur for: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'new' stamp: 'RA 11/3/2022 16:14:33'!
arrancarEn: unaPosicion mirandoHacia: unaDireccionCardinal

	^(self new inicializarEn: unaPosicion enDireccion: unaDireccionCardinal).! !


!MarsRover class methodsFor: 'error' stamp: 'RA 11/1/2022 16:37:58'!
errorComandoInvalido
	
	^'El comando ingresado no es válido'.! !


!classDefinition: #MarsRoverDireccionCardinal category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRoverDireccionCardinal
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverDireccionCardinal methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 16:24:03'!
avanzar 
	
	self subclassResponsibility.! !

!MarsRoverDireccionCardinal methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 16:24:20'!
girarALaDerecha 
	
	self subclassResponsibility.! !

!MarsRoverDireccionCardinal methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 16:24:23'!
girarALaIzquierda 
	
	self subclassResponsibility.! !

!MarsRoverDireccionCardinal methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 16:24:11'!
retroceder 
	
	self subclassResponsibility.! !


!MarsRoverDireccionCardinal methodsFor: 'initialize' stamp: 'AC 10/31/2022 16:13:57'!
initializeFor: aMarsRover
	  
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDireccionCardinal class' category: 'MarsRover-Ejercicio'!
MarsRoverDireccionCardinal class
	instanceVariableNames: ''!

!MarsRoverDireccionCardinal class methodsFor: 'new' stamp: 'AC 10/31/2022 19:23:17'!
for: aMarsRover
	  
	^(self new initializeFor: aMarsRover).! !


!classDefinition: #MarsRoverEste category: 'MarsRover-Ejercicio'!
MarsRoverDireccionCardinal subclass: #MarsRoverEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverEste methodsFor: 'movimientos y direcciones' stamp: 'RA 11/1/2022 16:13:09'!
avanzar

	^marsRover moverAlEste.! !

!MarsRoverEste methodsFor: 'movimientos y direcciones' stamp: 'RA 11/1/2022 16:13:56'!
girarALaDerecha

	^marsRover dirigirseAlSur.! !

!MarsRoverEste methodsFor: 'movimientos y direcciones' stamp: 'RA 11/1/2022 16:13:50'!
girarALaIzquierda

	^marsRover dirigirseAlNorte.! !

!MarsRoverEste methodsFor: 'movimientos y direcciones' stamp: 'RA 11/1/2022 16:13:14'!
retroceder

	^marsRover moverAlOeste.! !


!classDefinition: #MarsRoverNorte category: 'MarsRover-Ejercicio'!
MarsRoverDireccionCardinal subclass: #MarsRoverNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverNorte methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:03:20'!
avanzar 
	
	^marsRover moverAlNorte.! !

!MarsRoverNorte methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:04:05'!
girarALaDerecha 
	
	^marsRover dirigirseAlEste.! !

!MarsRoverNorte methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:04:30'!
girarALaIzquierda 
	
	^marsRover dirigirseAlOeste.! !

!MarsRoverNorte methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:03:36'!
retroceder 
	
	^marsRover moverAlSur.! !


!classDefinition: #MarsRoverOeste category: 'MarsRover-Ejercicio'!
MarsRoverDireccionCardinal subclass: #MarsRoverOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverOeste methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:05:08'!
avanzar
	
	^marsRover moverAlOeste.! !

!MarsRoverOeste methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:05:38'!
girarALaDerecha 
	
	^marsRover dirigirseAlNorte.! !

!MarsRoverOeste methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:05:50'!
girarALaIzquierda
	
	^marsRover dirigirseAlSur.! !

!MarsRoverOeste methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:05:18'!
retroceder
	
	^marsRover moverAlEste.! !


!classDefinition: #MarsRoverSur category: 'MarsRover-Ejercicio'!
MarsRoverDireccionCardinal subclass: #MarsRoverSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverSur methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:06:49'!
avanzar
	
	^marsRover moverAlSur.! !

!MarsRoverSur methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:07:32'!
girarALaDerecha
	
	^marsRover dirigirseAlOeste.! !

!MarsRoverSur methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:07:44'!
girarALaIzquierda
	
	^marsRover dirigirseAlEste.! !

!MarsRoverSur methodsFor: 'movimientos y direcciones' stamp: 'AC 10/31/2022 19:08:17'!
retroceder

	^marsRover moverAlNorte.! !
