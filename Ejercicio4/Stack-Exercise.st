!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:35:04'!
assert: anStack hasTheSameElementsAs: anotherStack
	
	anStack size timesRepeat: [(anStack pop) = (anotherStack pop)].


! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:27:26'!
test01FindWithAnEmptyPrefixShouldGiveAnError
	
	| prefixFinder stack aPrefix |
	
	aPrefix := ''.
	stack := self anEmptyStack.
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	self
		should: [ prefixFinder find ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix errorPrefixIsEmpty equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:27:23'!
test02FindWithAnEmptySpacePrefixShouldGiveAnError
	
	| prefixFinder stack aPrefix |
	
	aPrefix := ' '.
	stack := self anEmptyStack.
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	self
		should: [ prefixFinder find ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix errorPrefixHasAnEmptySpace equals: anError messageText ]
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:27:17'!
test03FindWithAPrefixContainingAnSpaceShouldGiveAnError

	| prefixFinder stack aPrefix |
	
	aPrefix := 'Ro '.
	stack := self anEmptyStack.
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	self
		should: [ prefixFinder find ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix errorPrefixHasAnEmptySpace equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:40:29'!
test04FindWithValidPrefixReturns0Coincidences
	
	| prefixFinder stack aPrefix coincidences auxiliarStack |
	
	aPrefix := 'Mo'.
	stack := self stackWithMoreThanOneElement.
	auxiliarStack := stack.
	
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	coincidences := prefixFinder find.

	self assert: coincidences isEmpty.
	self assert: auxiliarStack hasTheSameElementsAs: (self stackWithMoreThanOneElement).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:40:22'!
test05FindWithValidPrefixReturns1Coincidence
	
	| prefixFinder stack aPrefix coincidences auxiliarStack |
	
	aPrefix := 'Vo'.
	stack := self stackWithMoreThanOneElement.
	auxiliarStack := stack.
	
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	coincidences := prefixFinder find.
	
	self assert: coincidences size equals: 1.
	self assert: coincidences = (OrderedCollection with: 'Voto').
	self assert: auxiliarStack hasTheSameElementsAs: (self stackWithMoreThanOneElement).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 12:40:33'!
test06FindWithValidPrefixReturnsMoreThan1Coincidence
	
	| prefixFinder stack aPrefix coincidences auxiliarStack |
	
	aPrefix := 'Lo'.
	stack := self stackWithMoreThanOneElement.
	auxiliarStack := stack.

	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	coincidences := prefixFinder find.
	
	self assert: coincidences size equals: 2.
	self assert: coincidences = (OrderedCollection with: 'Lodo' with: 'Lobo').
	self assert: auxiliarStack hasTheSameElementsAs: (self stackWithMoreThanOneElement).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 13:11:57'!
test07FindWithNonStringPrefixShouldGiveAnError
	
	| prefixFinder stack aPrefix |
	
	aPrefix := 5.
	stack := self stackWithMoreThanOneElement.
	
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	self
		should: [ prefixFinder find ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix errorPrefixIsNotString equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RA 10/14/2022 13:12:02'!
test08FindInAnEmptyStackReturns0Coincidences

	| prefixFinder stack aPrefix coincidences |
	
	aPrefix := 'La'.
	stack := self anEmptyStack.
	
	prefixFinder := SentenceFinderByPrefix new: stack with: aPrefix.
	
	coincidences := prefixFinder find.
	
	self assert: stack isEmpty.
	self assert: coincidences isEmpty.! !


!SentenceFinderByPrefixTest methodsFor: 'stacks' stamp: 'RA 10/14/2022 12:24:29'!
anEmptyStack

	^OOStack new.! !

!SentenceFinderByPrefixTest methodsFor: 'stacks' stamp: 'RA 10/14/2022 12:26:31'!
stackWithMoreThanOneElement
	
	| stack |
	
	stack := self anEmptyStack.
	stack push: 'Rojo'.
	stack push: 'Voto'.
	stack push: 'Lobo'.
	stack push: 'Lodo'.
	
	^stack.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'RA 10/14/2022 12:43:27'!
isEmpty

	^elements isEmpty.! !

!OOStack methodsFor: 'testing' stamp: 'RA 10/14/2022 13:03:51'!
notEmpty

	^self isEmpty not.! !


!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 12:43:13'!
initialize

	elements := OrderedCollection new.! !

!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 12:43:16'!
pop

	^elements remove: self top.
	
! !

!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 12:43:56'!
push: aNewElement
	
	elements add: aNewElement.! !

!OOStack methodsFor: 'operations' stamp: 'AC 10/9/2022 18:18:43'!
signalStackIsEmpty
	
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 12:44:17'!
size

	^elements size.! !

!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 13:01:32'!
stackType
	
	^OOStackState initializeStackBySize: self.! !

!OOStack methodsFor: 'operations' stamp: 'RA 10/14/2022 12:58:57'!
top

	^self stackType top.
! !


!OOStack methodsFor: 'top' stamp: 'RA 10/14/2022 13:02:17'!
topInStackEmpty

	^self signalStackIsEmpty.! !

!OOStack methodsFor: 'top' stamp: 'RA 10/14/2022 13:02:27'!
topInStackNotEmpty

	^elements last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'as yet unclassified' stamp: 'AC 10/12/2022 11:47:18'!
initialize: anStack
	
	stack := anStack.! !

!OOStackState methodsFor: 'as yet unclassified' stamp: 'RA 10/14/2022 12:45:23'!
top

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: 'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'initialize' stamp: 'RA 10/14/2022 13:01:32'!
initializeStackBySize: anStack

	^(self subclasses detect: [:aSubclass | aSubclass isYourSize: anStack]) newWithStack: anStack.
	! !

!OOStackState class methodsFor: 'initialize' stamp: 'RA 10/14/2022 12:50:12'!
isYourSize: anStack
	
	self subclassResponsibility.
! !

!OOStackState class methodsFor: 'initialize' stamp: 'AC 10/12/2022 11:55:31'!
newWithStack: anStack

	^self new initialize: anStack! !


!classDefinition: #OOEmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #OOEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStack methodsFor: 'top' stamp: 'RA 10/14/2022 13:02:17'!
top

	^stack topInStackEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStack class' category: 'Stack-Exercise'!
OOEmptyStack class
	instanceVariableNames: ''!

!OOEmptyStack class methodsFor: 'test' stamp: 'RA 10/14/2022 12:50:05'!
isYourSize: anStack

	^anStack isEmpty! !


!classDefinition: #OONotEmptyStack category: 'Stack-Exercise'!
OOStackState subclass: #OONotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmptyStack methodsFor: 'top' stamp: 'RA 10/14/2022 13:02:27'!
top

	^stack topInStackNotEmpty.
 ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyStack class' category: 'Stack-Exercise'!
OONotEmptyStack class
	instanceVariableNames: ''!

!OONotEmptyStack class methodsFor: 'test' stamp: 'RA 10/14/2022 12:55:06'!
isYourSize: anStack

	^anStack notEmpty.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix coincidences auxiliarStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RA 10/14/2022 12:07:09'!
addElementToPrefixCoincidences: anElement
	
	coincidences add: anElement.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RA 10/14/2022 11:34:54'!
popElementFromStack: aBaseStack andMoveToStack: aDestinyStack

	| stackElement |
	
	stackElement := aBaseStack pop.
	aDestinyStack push: stackElement.
	
	^stackElement.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RA 10/14/2022 11:36:32'!
rebuildStack

	auxiliarStack size timesRepeat: [self popElementFromStack: auxiliarStack andMoveToStack: stack].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RA 10/14/2022 12:07:53'!
verifyIfElementBeginsWithPrefix: anElement

	(anElement beginsWith: prefix) ifTrue: [self addElementToPrefixCoincidences: anElement].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RA 10/14/2022 12:08:11'!
verifyPrefixForEachStackElement

	| stackElement |
	
	stack size timesRepeat: [
		stackElement := self popElementFromStack: stack andMoveToStack: auxiliarStack.
		self verifyIfElementBeginsWithPrefix: stackElement.
	]! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'RA 10/13/2022 22:48:40'!
initializeStack: anStack with: aPrefix
	
	auxiliarStack := OOStack new.
	stack := anStack.
	prefix := aPrefix.
	coincidences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'RA 10/14/2022 13:08:37'!
find
	
	self validatePrefix.
	self verifyPrefixForEachStackElement.
	self rebuildStack.
	
	^coincidences.! !


!SentenceFinderByPrefix methodsFor: 'error' stamp: 'RA 10/14/2022 13:09:03'!
validatePrefix

	self validatePrefixNotString.
	self validatePrefixEmpty.
	self validatePrefixWithEmptySpace.! !

!SentenceFinderByPrefix methodsFor: 'error' stamp: 'RA 10/14/2022 13:08:05'!
validatePrefixEmpty

	(prefix isEmpty) ifTrue: [self error: self class errorPrefixIsEmpty].! !

!SentenceFinderByPrefix methodsFor: 'error' stamp: 'RA 10/14/2022 13:08:09'!
validatePrefixNotString

	(prefix isString not) ifTrue: [self error: self class errorPrefixIsNotString].! !

!SentenceFinderByPrefix methodsFor: 'error' stamp: 'RA 10/14/2022 13:08:14'!
validatePrefixWithEmptySpace

	(prefix includes: $ ) ifTrue: [self error: self class errorPrefixHasAnEmptySpace].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'initialize' stamp: 'RA 10/13/2022 22:37:03'!
new: anStack with: aPrefix

	^self new initializeStack: anStack with: aPrefix.! !


!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'RA 10/14/2022 11:18:24'!
errorPrefixHasAnEmptySpace

	^'Prefix cannot contain an empty space'.! !

!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'RA 10/14/2022 11:18:32'!
errorPrefixIsEmpty

	^'Prefix cannot be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'RA 10/14/2022 11:18:42'!
errorPrefixIsNotString
	
	^'Prefix is not an String'.! !
