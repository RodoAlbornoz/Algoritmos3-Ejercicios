!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'firstPortfolio secondPortfolio firstAccount secondAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 12:55:14'!
test01EmptyPortfolioHas0Balance

	self assert: firstPortfolio balance equals: 0 * peso! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test02PortfolioWithAccountHasABalance
	
	Deposit register: 100 * peso on: firstAccount.
	firstPortfolio register: firstAccount.
	
	self assert: firstPortfolio balance equals: 100 * peso! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test03PortfolioWithAccountHasARegisteredATransaction
	
	| withdraw |
	
	withdraw := Withdraw register: 25 * peso on: firstAccount..
	firstPortfolio register: firstAccount.
	
	self assert: (firstPortfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:54'!
test04PortfolioWithAccountHasNotRegisteredATransaction
	
	| deposit |
	
	Deposit register: 25 * peso on: firstAccount.
	deposit := Withdraw register: 100 * peso on: secondAccount.
	firstPortfolio register: firstAccount.
	
	self deny: (firstPortfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test05PortfolioWithAccountReturnsAllItsTransactions
	
	| transactions withdraw deposit |
	
	withdraw := Withdraw register: 50 * peso on: firstAccount.
	deposit := Deposit register: 50 * peso on: firstAccount.
	firstPortfolio register: firstAccount.
	
	transactions := OrderedCollection new.
	transactions add: withdraw.
	transactions add: deposit.
	
	self assert: firstPortfolio transactions equals: transactions.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test06BalanceOfPortfolioIsEqualToSumOfBalances
	
	Deposit register: 10 * peso on: firstAccount.
	secondPortfolio register: firstAccount.
	firstPortfolio register: secondPortfolio. 

	self assert: firstPortfolio balance equals: 10 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test07APortfolioCannotAddTheSameAccountTwice

	firstPortfolio register: firstAccount.
	
	self assertAccountAlreadyExistsWhenRegistering: firstAccount in: firstPortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test08APortfolioCannotAddAnAlreadyExistingAccountInAPortfolioPreviouslyAdded

	secondPortfolio register: firstAccount.
	firstPortfolio register: secondPortfolio.
	
	self assertAccountAlreadyExistsWhenRegistering: firstAccount in: firstPortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:07:42'!
test09APortfolioCannotAddItself

	self assertAccountAlreadyExistsWhenRegistering: firstPortfolio in: firstPortfolio.! !

!PortfolioTest methodsFor: 'test' stamp: 'RA 11/11/2022 13:10:47'!
test10APortfolioCannotAddAnotherOneIfTheFirstOneIncludesAnAccountInTheSecondOne

	firstPortfolio register: firstAccount.
	secondPortfolio register: firstAccount.
	
	self assertAccountAlreadyExistsWhenRegistering: firstPortfolio in: secondPortfolio.! !


!PortfolioTest methodsFor: 'asserts' stamp: 'RA 11/11/2022 12:49:18'!
assertAccountAlreadyExistsWhenRegistering: account1 in: account2.

	self
		should: [account2 register: account1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio errorPortfolioAlreadyHasAccount equals: anError messageText].! !


!PortfolioTest methodsFor: 'setUp' stamp: 'RA 11/11/2022 13:10:54'!
setUp

	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:16'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:19'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:23'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:25'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:28'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:31'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'test' stamp: 'RA 11/11/2022 11:56:33'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'firstReceptiveAccount secondReceptiveAccount amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'RA 11/11/2022 13:33:30'!
test01AccountsHaveCorrectBalanceAfterATransfer
	
	Deposit register: 100 * peso on: secondReceptiveAccount.
	Transfer register: amount from: secondReceptiveAccount to: firstReceptiveAccount.

	self assert: secondReceptiveAccount balance equals: amount.
	self assert: firstReceptiveAccount balance equals: amount! !

!TransferTest methodsFor: 'tests' stamp: 'RA 11/11/2022 13:33:30'!
test02TransferKnowsItsValue
	
	| transfer |
	
	transfer := Transfer register: amount from: secondReceptiveAccount to: firstReceptiveAccount.

	self assert: (transfer valueEquals: amount).! !

!TransferTest methodsFor: 'tests' stamp: 'RA 11/11/2022 13:33:30'!
test03DepositKnowsItsOppositeLeg
	
	| transfer |
	
	transfer := Transfer register: amount from: secondReceptiveAccount to: firstReceptiveAccount.

	self assert: transfer deposit oppositeLeg equals: transfer withdraw.! !

!TransferTest methodsFor: 'tests' stamp: 'RA 11/11/2022 13:33:30'!
test04WithdrawKnowsItsOppositeLeg
	
	| transfer |
	
	transfer := Transfer register: amount from: secondReceptiveAccount  to: firstReceptiveAccount.

	self assert: transfer withdraw oppositeLeg equals: transfer deposit.! !

!TransferTest methodsFor: 'tests' stamp: 'RA 11/11/2022 13:34:00'!
test05CannotTransferToANonExistentReceiver
		
	self
		should: [Transfer register: amount from: secondReceptiveAccount to: #Hello]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer errorReceptiveAccountDoesNotExist equals: anError messageText].
! !


!TransferTest methodsFor: 'setUp' stamp: 'RA 11/11/2022 13:33:30'!
setUp

	firstReceptiveAccount := ReceptiveAccount new.
	secondReceptiveAccount := ReceptiveAccount new.
	amount := 50 * peso.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'RA 11/9/2022 16:07:26'!
balance

	self subclassResponsibility.
	
! !

!Account methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:04:54'!
canNotBeRegistered: anAccount

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'RA 11/9/2022 16:08:45'!
hasRegistered: aTransaction

	self subclassResponsibility.
	
! !

!Account methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:27:50'!
register: anAccount

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'RA 11/9/2022 16:07:49'!
transactions

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'RA 11/7/2022 14:58:44'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:00:16'!
balance
	
	(accounts isEmpty) ifTrue: [^0 * peso].
	
	^accounts sum: [:anAccount | anAccount balance].
	
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:30:30'!
canNotBeRegistered: anAccount

	^(self = anAccount or: [self accountContainsOrIsContained: anAccount]).! !

!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/9/2022 14:58:51'!
hasRegistered: aTransaction
	
	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:09:58'!
register: anAccount 

	(self canNotBeRegistered: anAccount) ifTrue: [self error: self class errorPortfolioAlreadyHasAccount].
	
	accounts add: anAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/9/2022 15:05:49'!
transactions
	
	| transactions |
	transactions := OrderedCollection new.
	
	accounts do: [:anAccount | transactions addAll: anAccount transactions].
	
	^transactions.! !


!Portfolio methodsFor: 'private' stamp: 'RA 11/11/2022 12:21:15'!
accountContainsOrIsContained: anAccount

	^accounts anySatisfy: [
		:anAccountOfPortfolio | (anAccountOfPortfolio canNotBeRegistered: anAccount) or: 
		[anAccount canNotBeRegistered: anAccountOfPortfolio]
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'RA 11/9/2022 15:16:47'!
errorPortfolioAlreadyHasAccount

	^'Cannot add to portfolio an existing account'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:32:48'!
balance

	| balance |
	balance := 0.

	transactions do: [:aTransaction | balance := aTransaction addAmountTo: balance].
	
	^balance. 
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:04:55'!
canNotBeRegistered: anAccount

	^self = anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:27:33'!
hasRegistered: aTransaction

	^transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:24:00'!
register: aTransaction

	transactions add: aTransaction! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/11/2022 12:27:20'!
transactions 

	^transactions copy! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'RA 11/11/2022 12:27:14'!
initialize

	transactions := OrderedCollection new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'RA 11/11/2022 13:15:00'!
addAmountTo: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'RA 11/11/2022 13:15:27'!
register: aValue on: anAccount

	| transaction |
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'RA 11/11/2022 12:32:48'!
addAmountTo: aBalance
	
	^aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'RA 11/11/2022 11:51:20'!
initializeFor: aTransfer

	transfer := aTransfer.! !


!TransferLeg methodsFor: 'balance' stamp: 'RA 11/11/2022 12:32:48'!
addAmountTo: unBalance
	
	self subclassResponsibility.! !


!TransferLeg methodsFor: 'value' stamp: 'RA 11/11/2022 11:51:50'!
value

	^transfer value.! !


!TransferLeg methodsFor: 'leg' stamp: 'RA 11/11/2022 11:51:33'!
oppositeLeg

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'RA 11/11/2022 13:17:23'!
registerFor: aTransfer on: anAccount

	| transfer |
	
	transfer := self for: aTransfer.
	anAccount register: transfer.
		
	^ transfer! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'balance' stamp: 'RA 11/11/2022 12:32:48'!
addAmountTo: aBalance

	^aBalance + self value.
! !


!DepositLeg methodsFor: 'leg' stamp: 'RA 11/11/2022 11:52:12'!
oppositeLeg

	^transfer withdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'RA 11/11/2022 11:53:09'!
for: aTransfer

	^ self new initializeFor: aTransfer.! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'balance' stamp: 'RA 11/11/2022 12:32:48'!
addAmountTo: aBalance

	^aBalance - self value.
	
! !


!WithdrawLeg methodsFor: 'leg' stamp: 'RA 11/11/2022 11:52:43'!
oppositeLeg

	^transfer deposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'RA 11/11/2022 11:52:57'!
for: aTransfer

	^ self new initializeFor: aTransfer.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'RA 11/11/2022 11:46:33'!
value

	^value.! !


!Withdraw methodsFor: 'balance' stamp: 'RA 11/11/2022 12:32:48'!
addAmountTo: aBalance
	
	^aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'legs' stamp: 'AC 11/8/2022 14:06:27'!
deposit

	^deposit. ! !

!Transfer methodsFor: 'legs' stamp: 'AC 11/8/2022 14:06:41'!
withdraw

	^withdraw. ! !


!Transfer methodsFor: 'value' stamp: 'RA 11/11/2022 13:26:29'!
value 

	^value.
! !

!Transfer methodsFor: 'value' stamp: 'RA 11/11/2022 13:27:20'!
valueEquals: anAmount

	^value = anAmount.! !


!Transfer methodsFor: 'initialization' stamp: 'RA 11/11/2022 11:54:24'!
initializeFor: aValue from: anAccount to: otherAccount
	
	value := aValue.
	deposit := DepositLeg registerFor: self on: otherAccount.
	withdraw := WithdrawLeg registerFor: self on: anAccount.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error' stamp: 'RA 11/11/2022 13:13:56'!
errorReceptiveAccountDoesNotExist

	^'Cannot send money to an nonexistent receiver'! !


!Transfer class methodsFor: 'instance creation' stamp: 'RA 11/11/2022 13:14:31'!
register: aValue from: anAccount to: otherAccount

	(otherAccount isKindOf: ReceptiveAccount) ifFalse: [self error: self errorReceptiveAccountDoesNotExist].
	
	^self new initializeFor: aValue from: anAccount to: otherAccount.! !
