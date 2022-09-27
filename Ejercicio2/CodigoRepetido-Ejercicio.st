!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:53:57'!
assertACustomerBookShouldBeEmpty: aCustomerBook 

	[:anError | 
	self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: aCustomerBook isEmpty]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/27/2022 15:06:27'!
assertInACustomerBook: aCustomerBook AreActive: quantityActive AreSuspended: quantitySuspended TotalNumber: totalCustomers		
	
	self assert: quantityActive equals: aCustomerBook numberOfActiveCustomers.
	self assert: quantitySuspended equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:56:44'!
assertTheOnlyCustomerIn: aCustomerBook Is: aName
	
	[self assert: aCustomerBook numberOfCustomers = 1.
        	self assert: (aCustomerBook includesCustomerNamed: aName)].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/26/2022 11:14:51'!
assertTheTimeLimitAfterRunningIs: aTimeLimit FromACustomer: aCustomerBook
	
	| millisecondsBeforeRunning millisecondsAfterRunning realTime|

	millisecondsBeforeRunning := self runningTime .
	[aCustomerBook value ]. 
	millisecondsAfterRunning := self runningTime .
	
	realTime := millisecondsAfterRunning-millisecondsBeforeRunning.
	
	self assert: (self runningTime: realTime MustBeLowerThan: (self convertToMiliseconds: aTimeLimit)).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/26/2022 11:49:47'!
convertToMiliseconds: aTime

	^aTime*millisecond .! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/26/2022 11:49:44'!
runningTime

	^Time millisecondClockValue * millisecond.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:48:19'!
runningTime: anAmountOfTime MustBeLowerThan: timeLimit
	
	^(anAmountOfTime < timeLimit).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:50:03'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	self assertTheTimeLimitAfterRunningIs: 50 FromACustomer: [customerBook addCustomerNamed: johnLennon].
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:50:08'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self assertTheTimeLimitAfterRunningIs: 100 FromACustomer: [customerBook addCustomerNamed: paulMcCartney].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:51:51'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self when: [customerBook addCustomerNamed: '']
	Do: (self assertACustomerBookShouldBeEmpty: customerBook) 
	WithError: Error.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:51:55'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon paulMcCartney|
		
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self when: [customerBook removeCustomerNamed: paulMcCartney]
	Do: (self assertTheOnlyCustomerIn: customerBook Is: johnLennon)
	WithError: NotFound.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/27/2022 14:58:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addACustomerAndThenSuspend: paulMcCartney. 
	
	self assertInACustomerBook: customerBook AreActive: (customerBook thereIsNoCustomer) AreSuspended: (customerBook thereIsOneCustomer) 
							TotalNumber: (customerBook thereIsOneCustomer). 
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/27/2022 14:58:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	customerBook addACustomerAndThenSuspend: paulMcCartney .
	customerBook removeCustomerNamed: paulMcCartney.

	self assertInACustomerBook: customerBook AreActive: (customerBook thereIsNoCustomer) AreSuspended: (customerBook thereIsNoCustomer) 
							TotalNumber: (customerBook thereIsNoCustomer).
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 14:52:10'!
test07CanNotSuspendAnInvalidCustomer

    	| customerBook johnLennon ringoStarr |

    	customerBook := CustomerBook new.
    	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	
    	customerBook addCustomerNamed: johnLennon.
	
	self when: [customerBook suspendCustomerNamed: ringoStarr]
	Do: (self assertTheOnlyCustomerIn: customerBook Is: johnLennon)
	WithError: CantSuspend.
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/27/2022 14:59:53'!
test08CanNotSuspendAnAlreadySuspendedCustomer

    	| customerBook johnLennon |

    	customerBook := CustomerBook new.
    	johnLennon := 'John Lennon'.
	
	customerBook addACustomerAndThenSuspend: johnLennon. 
	
	self when: [customerBook suspendCustomerNamed: johnLennon]
	Do: (self assertTheOnlyCustomerIn: customerBook Is: johnLennon)
	WithError: CantSuspend.
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'RA 9/25/2022 15:02:38'!
when: aClosure Do: anotherClosure WithError: anError
	[aClosure value. self fail]
		on: anError 
		do: anotherClosure.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'AC 9/23/2022 19:45:49'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'RA 9/25/2022 15:00:10'!
thereIsNoCustomer
	^0.! !

!CustomerBook methodsFor: 'testing' stamp: 'LV 9/24/2022 12:07:34'!
thereIsOneCustomer
	^1.! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/27/2022 14:57:21'!
addACustomerAndThenSuspend: aName
	self addCustomerNamed: aName .
	self suspendCustomerNamed: aName .! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2022 19:48:39'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2022 19:30:41'!
numberOfCustomers
	
	^(self numberOfActiveCustomers + self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/26/2022 11:18:33'!
removeCustomerFrom: aCollection Named: aName
	
	(aCollection includes: aName ) ifTrue: [aCollection remove: aName].
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'LV 9/25/2022 08:56:58'!
removeCustomerNamed: aName 
	
	(self includesCustomerNamed: aName) ifFalse:[^ NotFound signal.].
	
	self removeCustomerFrom: active Named: aName.
 	
	self removeCustomerFrom: suspended Named: aName.



	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2022 19:54:03'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
