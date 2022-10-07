!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:39:08'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:01:16'!
test02StackNoDeberiaEstarVacioLuegoDeAgregarUnElemento

	| stack |
	
	stack := Stack new.
	
	stack push: 'hola'.
	
	self deny: stack isEmpty. ! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:01:26'!
test03StackDeberiaEstarVacioLuegoDeEliminarUnElementoAgregado

	| stack |
	
	stack := Stack new.
	
	stack push: 'hola'.
	stack pop.
	
	self assert: stack isEmpty. ! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:01:44'!
test04StackDevuelveElElementoEliminado

	| stack primerElemento segundoElemento elementoEliminado|
	
	stack := Stack new.
	
	primerElemento := 'Boca'.
	segundoElemento := 'River'.
	stack push: primerElemento .
	stack push: segundoElemento.	
	
	elementoEliminado := stack pop.
	
	self assert: elementoEliminado equals: segundoElemento.! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:01:56'!
test05StackDevuelveElUltimoElementoAgregado

	| stack  primerElemento segundoElemento ultimoElementoAgregado|
	
	stack := Stack new.
	
	primerElemento := 'Boca'.
	segundoElemento := 'River'.
	stack push: primerElemento .	
	stack push: segundoElemento .
	
	ultimoElementoAgregado := stack top.

	self assert: ultimoElementoAgregado equals: segundoElemento .! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:39:20'!
test06StackDeberiaDevolverErrorSiSeIntentaEliminarCuandoEstaVacio

	| stack |
	
	stack := Stack new.

	[ stack pop.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = Stack stackEmptyError .
			self assert: stack isEmpty ].
	! !

!StackTest methodsFor: 'testing' stamp: 'AC 10/7/2022 16:39:25'!
test07StackDeberiaDevolverErrorSiSeIntentaConsultarCuandoEstaVacio

	| stack |
	
	stack := Stack new.

	[ stack top.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = Stack stackEmptyError .
			self assert: stack isEmpty ].
	! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'pila cantidad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'operaciones' stamp: 'AC 10/7/2022 16:02:22'!
initialize
	super initialize.
	pila := OrderedCollection new.! !

!Stack methodsFor: 'operaciones' stamp: 'AC 10/7/2022 14:05:38'!
isEmpty

	^pila isEmpty.! !

!Stack methodsFor: 'operaciones' stamp: 'AC 10/7/2022 16:17:13'!
pop

	self isEmpty ifFalse:[	^pila removeLast.].
	self isEmpty ifTrue:[	^self signalStackIsEmpty].! !

!Stack methodsFor: 'operaciones' stamp: 'AC 10/7/2022 16:03:04'!
push: nuevoElemento
	
	pila add: nuevoElemento.! !

!Stack methodsFor: 'operaciones' stamp: 'AC 10/7/2022 16:17:19'!
top

	self isEmpty ifFalse:[^pila last].
	self isEmpty ifTrue:[	^self signalStackIsEmpty].! !


!Stack methodsFor: 'error' stamp: 'AC 10/7/2022 16:33:59'!
signalStackIsEmpty
	
	self error: self class stackEmptyError.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: 'pila'!

!Stack class methodsFor: 'as yet unclassified' stamp: 'AC 10/7/2022 14:05:25'!
stackEmptyError

	^'Stack is empty'.! !
