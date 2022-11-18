!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportsTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #ReportsTest
	instanceVariableNames: 'originAccount destinationAccount portfolio transferNetOfOriginAccount transferNetOfPortfolio accountSummaryOfOriginAccount accountSummaryOfPortfolio expectedNet angelesPortfolio angelesAccount juanAccount lucasAccount ramiroPortfolio alejandroPortfolio expectedReport ramiroPortfolioWithOneAccount ramiroPortfolioWithAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReportsTest methodsFor: 'account summary - tests' stamp: 'AC 11/18/2022 13:37:45'!
test01ACreatedAccountHasSummaryOfZeroBalance

	expectedReport add: 'Balance = 0 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:13:17'!
test02AnAccountWithADepositHasDepositAndBalanceOnSummary
	
	Deposit register: 20 * peso on: originAccount. 
	
	expectedReport add: 'Deposito por 20 * pesos'.
	expectedReport add: 'Balance = 20 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.
	
	
	! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:13:17'!
test03AnAccountWithAWithdrawHasDepositAndWithdrawOnSummary

	Withdraw register: 50 * peso on: originAccount. 
	
	expectedReport add: 'Extracción por 50 * pesos'.
	expectedReport add: 'Balance = -50 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:13:17'!
test04AnAccountWithATransferDepositHasTransferDepositAndBalanceOnSummary

	Transfer amount: 25 * peso from: destinationAccount to: originAccount.
	
	expectedReport add: 'Entrada por transferencia de 25 * pesos'.
	expectedReport add: 'Balance = 25 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:13:17'!
test05AnAccountWithATransferWithdrawHasTransferWithdrawAndBalanceOnSummary

	Transfer amount: 70 * peso from: originAccount to: destinationAccount.

	expectedReport add: 'Salida por transferencia de 70 * pesos'.
	expectedReport add: 'Balance = -70 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:13:17'!
test06AnAccountWithMultipleTransactionsAreShowedOnSummary

	Withdraw register: 10 * peso on: originAccount.
	Transfer amount: 70 * peso from: destinationAccount to: originAccount.

	expectedReport add: 'Extracción por 10 * pesos'.
	expectedReport add: 'Entrada por transferencia de 70 * pesos'.
	expectedReport add: 'Balance = 60 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfOriginAccount report.! !

!ReportsTest methodsFor: 'account summary - tests' stamp: 'RA 11/18/2022 13:04:32'!
test07APortfolioWithMultipleTransactionsAreShowedOnSummary

	portfolio add: originAccount.

	Deposit register: 10 * peso on: originAccount.
	Transfer amount: 30 * peso from: originAccount to: destinationAccount.
	
	expectedReport add: 'Deposito por 10 * pesos'.
	expectedReport add: 'Salida por transferencia de 30 * pesos'.
	expectedReport add: 'Balance = -20 * pesos'.
	
	self assert: expectedReport equals: accountSummaryOfPortfolio report.! !


!ReportsTest methodsFor: 'net summary - tests' stamp: 'RA 11/18/2022 13:14:41'!
test08ANetSummaryOfAccountWithoutTransfersIsZero
	
	expectedNet := 0 * peso.
	self assert: expectedNet equals: transferNetOfOriginAccount report.! !

!ReportsTest methodsFor: 'net summary - tests' stamp: 'RA 11/18/2022 13:13:27'!
test09ANetSummaryOnAnAccountWithWithdrawTransfer

	Transfer amount: 35 * peso from: originAccount to: destinationAccount.
	expectedNet := -35 * peso.
	
	self assert: expectedNet equals: transferNetOfOriginAccount report.! !

!ReportsTest methodsFor: 'net summary - tests' stamp: 'RA 11/18/2022 13:13:27'!
test10ANetSummaryOnAnAccountWithDepositTransfer

	Transfer amount: 80 * peso from: destinationAccount to: originAccount.
	expectedNet := 80 * peso.
	
	self assert: expectedNet equals: transferNetOfOriginAccount report.! !

!ReportsTest methodsFor: 'net summary - tests' stamp: 'RA 11/18/2022 13:13:27'!
test11ANetSummaryOnAnAccountWithVariousTransfers

	Transfer amount: 80 * peso from: originAccount to: destinationAccount.
	Transfer amount: 30 * peso from: destinationAccount to: originAccount.
	Transfer amount: 15 * peso from: destinationAccount to: originAccount.
	
	expectedNet := -35 * peso.
	
	self assert: expectedNet equals: transferNetOfOriginAccount report.! !

!ReportsTest methodsFor: 'net summary - tests' stamp: 'RA 11/17/2022 14:16:37'!
test12ANetSummaryOnAPortfolioWithAccounts

	portfolio add: originAccount.
	Transfer amount: 15 * peso from: originAccount to: destinationAccount.
	expectedNet := -15 * peso.
	
	self assert: expectedNet equals: transferNetOfPortfolio report.! !


!ReportsTest methodsFor: 'setUp' stamp: 'AC 11/18/2022 16:33:22'!
setUp
	
	expectedReport := OrderedCollection new.
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	accountSummaryOfOriginAccount := AccountSummary with: originAccount.
	accountSummaryOfPortfolio := AccountSummary with: portfolio.
	transferNetOfOriginAccount := TransferNet with: originAccount.
	transferNetOfPortfolio := TransferNet with: portfolio.
		
	alejandroPortfolio := Portfolio named: 'Portfolio de Alejandro'.
	angelesPortfolio := Portfolio named: 'Portfolio de Angeles'.
	ramiroPortfolio := Portfolio named: 'Portfolio de Ramiro'.	
	angelesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	juanAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	lucasAccount := ReceptiveAccount named: 'Cuenta de Lucas'.	
	ramiroPortfolioWithOneAccount := Portfolio named: 'Portfolio de Ramiro' with: angelesAccount.	 
	ramiroPortfolioWithAccounts := Portfolio named: 'Portfolio de Ramiro' with: angelesAccount with: juanAccount.
	
	! !


!ReportsTest methodsFor: 'portfolio tree printer - tests' stamp: 'AC 11/18/2022 16:34:43'!
test13APortfolioWithoutAccountsShowsReportOnlyWithPortfolioName

	expectedReport add: 'Portfolio de Ramiro'.
	
	self assert: expectedReport equals: (PortfolioTreePrinter for: ramiroPortfolio) report.! !

!ReportsTest methodsFor: 'portfolio tree printer - tests' stamp: 'AC 11/18/2022 16:51:50'!
test14APortfolioWithOneAccountShowsReportWithPortfolioAndAccount

	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
        
	self assert: expectedReport equals: (PortfolioTreePrinter for: ramiroPortfolioWithOneAccount) report.! !

!ReportsTest methodsFor: 'portfolio tree printer - tests' stamp: 'AC 11/18/2022 16:51:39'!
test15APortfolioWithManyAccountShowsReportWithPortfolioAndItsAccounts
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '  Cuenta de Juan'.	
        	
	self assert: expectedReport equals: (PortfolioTreePrinter for: ramiroPortfolioWithAccounts) report.! !

!ReportsTest methodsFor: 'portfolio tree printer - tests' stamp: 'AC 11/18/2022 16:39:22'!
test16APortfolioContainingAccountAndPortfolioWithAccountsShowsReportOfAllStructure

	alejandroPortfolio add: lucasAccount.
	ramiroPortfolioWithAccounts add: alejandroPortfolio.
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '  Cuenta de Juan'.	
	expectedReport add: '  Portfolio de Alejandro'.	
	expectedReport add: '    Cuenta de Lucas'.

	self assert: expectedReport equals: (PortfolioTreePrinter for: ramiroPortfolioWithAccounts) report..! !

!ReportsTest methodsFor: 'portfolio tree printer - tests' stamp: 'AC 11/18/2022 16:50:08'!
test17APortfolioContainingAccountsAndPortfoliosWithAccountsShowsReportOfAllStructure

	angelesPortfolio add: angelesAccount.
	alejandroPortfolio add: angelesPortfolio.
	ramiroPortfolio add: alejandroPortfolio.
	ramiroPortfolio add: juanAccount.

	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Portfolio de Alejandro'.	
	expectedReport add: '    Portfolio de Angeles'.	
	expectedReport add: '      Cuenta de Angeles'.
	expectedReport add: '  Cuenta de Juan'.	
	
	self assert: expectedReport equals: (PortfolioTreePrinter for: ramiroPortfolio) report .! !


!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:17:52'!
test18APortfolioWithoutAccountsShowsReportOnlyWithPortfolioNameAndBalance
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Balance = 0 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolio) report.! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test19APortfolioWithOneAccountShowsReportWithPortfolioAccountAndBalances
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Balance = 0 * pesos'.
	expectedReport add: '  Balance = 0 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test20APortfolioWithADepositOnItsAccountShowsReportWithDepositAndBalances
	
	Deposit register: 30 * peso on: angelesAccount.
		
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Deposito por 30 * pesos'.
	expectedReport add: '    Balance = 30 * pesos'.
	expectedReport add: '  Balance = 30 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.
! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test21APortfolioWithAWithdrawOnItsAccountShowsReportWithWithdrawAndBalances
	
	Withdraw register: 25 * peso on: angelesAccount.
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Extracción por 25 * pesos'.
	expectedReport add: '    Balance = -25 * pesos'.
	expectedReport add: '  Balance = -25 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test22APortfolioWithATransferDepositOnItsAccountShowsReportWithTransferDepositAndBalances
	
	Transfer amount: 70 * peso from: juanAccount to: angelesAccount.
	 
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Entrada por transferencia de 70 * pesos'.
	expectedReport add: '    Balance = 70 * pesos'.
	expectedReport add: '  Balance = 70 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.	! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test23APortfolioWithATransferWithdrawOnItsAccountShowsReportWithTransferWithdrawAndBalances

	Transfer amount: 47 * peso from: angelesAccount to: juanAccount. 

	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Salida por transferencia de 47 * pesos'.
	expectedReport add: '    Balance = -47 * pesos'.
	expectedReport add: '  Balance = -47 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.	! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:12'!
test24APortfolioWithManyTransactionsOnItsAccountShowsReportWithTransactionsAndBalances
	
	Deposit register: 20 * peso on: angelesAccount. 
	Transfer amount: 10 * peso from: juanAccount to: angelesAccount. 
	Transfer amount: 15 * peso from: angelesAccount to: juanAccount. 
	
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Deposito por 20 * pesos'.
	expectedReport add: '    Entrada por transferencia de 10 * pesos'.
	expectedReport add: '    Salida por transferencia de 15 * pesos'.
	expectedReport add: '    Balance = 15 * pesos'.
	expectedReport add: '  Balance = 15 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithOneAccount) report.! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:22'!
test25APortfolioWithManyAccountsShowsReportWithAllTransactionsAndBalances

	Deposit register: 60 * peso on: angelesAccount. 
	Transfer amount: 35 * peso from: juanAccount to: angelesAccount. 
	Withdraw register: 30 * peso on: juanAccount.
	
	expectedReport  add: 'Portfolio de Ramiro'.
	expectedReport  add: '  Cuenta de Angeles'.
	expectedReport  add: '    Deposito por 60 * pesos'.
	expectedReport  add: '    Entrada por transferencia de 35 * pesos'.
	expectedReport  add: '    Balance = 95 * pesos'.
	expectedReport  add: '  Cuenta de Juan'.
	expectedReport  add: '    Salida por transferencia de 35 * pesos'.
	expectedReport  add: '    Extracción por 30 * pesos'.
	expectedReport  add: '    Balance = -65 * pesos'.
	expectedReport  add: '  Balance = 30 * pesos'.
	
	self assert: expectedReport  equals: (PortfolioDetailedTreePrinter for: ramiroPortfolioWithAccounts) report.! !

!ReportsTest methodsFor: 'portfolio detailed tree printer - tests' stamp: 'AC 11/18/2022 16:33:22'!
test26APortfolioWithAPortfolioShowsReportWithAllAccountTransactionsAndBalances

	alejandroPortfolio add: lucasAccount.
	ramiroPortfolioWithAccounts add: alejandroPortfolio.
	
	Deposit register: 10 * peso on: lucasAccount. 
	Transfer amount: 70 * peso from: juanAccount to: angelesAccount. 
	Deposit register: 15 * peso on: angelesAccount. 
	Withdraw register: 30 * peso on: angelesAccount.
		
	expectedReport add: 'Portfolio de Ramiro'.
	expectedReport add: '  Cuenta de Angeles'.
	expectedReport add: '    Entrada por transferencia de 70 * pesos'.
	expectedReport add: '    Deposito por 15 * pesos'.
	expectedReport add: '    Extracción por 30 * pesos'.
	expectedReport add: '    Balance = 55 * pesos'.
	expectedReport add: '  Cuenta de Juan'.
	expectedReport add: '    Salida por transferencia de 70 * pesos'.
	expectedReport add: '    Balance = -70 * pesos'.
	expectedReport add: '  Portfolio de Alejandro'.
	expectedReport add: '    Cuenta de Lucas'.
	expectedReport add: '      Deposito por 10 * pesos'.
	expectedReport add: '      Balance = 10 * pesos'.
	expectedReport add: '    Balance = 10 * pesos'.
	expectedReport add: '  Balance = -5 * pesos'.
	
	self assert: expectedReport equals: (PortfolioDetailedTreePrinter for: 	ramiroPortfolioWithAccounts) report.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'RA 11/13/2022 18:46:20'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:59:19'!
forTransactionsDo: aBlock

	self transactions do: aBlock.! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Parte2'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'AC 11/16/2022 13:46:51'!
named: aName

	^self new initializeWith: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Parte2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Portfolio methodsFor: 'initialization' stamp: 'RA 11/17/2022 14:02:23'!
initialize 

	accounts := OrderedCollection new.
	name := ''.! !

!Portfolio methodsFor: 'initialization' stamp: 'AC 11/16/2022 13:36:35'!
initializeWith: aName

	name := aName.
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'RA 11/13/2022 18:54:00'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'private' stamp: 'AC 11/16/2022 13:57:33'!
accounts
	
	^accounts.! !

!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'private' stamp: 'AC 11/16/2022 14:01:39'!
name
	^name! !

!Portfolio methodsFor: 'private' stamp: 'AC 11/16/2022 18:03:47'!
reportFor: aReport

	^aReport reportForPortfolio: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Parte2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 11/18/2022 13:33:17'!
named: aName with: anAccount

	^self new initializeWith: aName;
		add: anAccount;
		yourself
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 11/18/2022 13:33:27'!
named: aName with: anAccount with: anotherAccount

	^self new initializeWith: aName;
		add: anAccount;
		add: anotherAccount;
		yourself.
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Parte2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'RA 11/17/2022 14:02:39'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	name := ''.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AC 11/16/2022 13:49:33'!
initializeWith: aName

	name := aName.
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RA 11/13/2022 18:53:07'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'AC 11/16/2022 14:02:07'!
name
	^name! !

!ReceptiveAccount methodsFor: 'private' stamp: 'AC 11/16/2022 18:03:41'!
reportFor: aReport

	^aReport reportForReceptiveAccount: self.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'account summary' stamp: 'RA 11/16/2022 13:07:09'!
reportFor: aReport
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Parte2'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'account summary' stamp: 'RA 11/16/2022 13:13:20'!
reportFor: aReport

	^aReport reportForDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Parte2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Parte2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferDepositLeg methodsFor: 'account summary' stamp: 'RA 11/16/2022 13:13:03'!
reportFor: aReport

	^aReport reportForTransferDepositLeg: self.! !


!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'account summary' stamp: 'RA 11/16/2022 13:13:12'!
reportFor: aReport

	^aReport reportForTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'account summary' stamp: 'RA 11/16/2022 13:13:28'!
reportFor: aReport

	^aReport reportForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Parte2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Report methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:12:42'!
report

	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Parte2'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account summaryMovements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummary methodsFor: 'main protocol' stamp: 'RA 11/18/2022 12:02:48'!
report
	
	account forTransactionsDo: [:aTransaction | summaryMovements add: (aTransaction reportFor: self)].
	summaryMovements add: 'Balance = ',(account balance) asString.
	
	^summaryMovements.! !

!AccountSummary methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:20'!
reportForDeposit: aDeposit
	
	^('Deposito por ',(aDeposit value) asString).! !

!AccountSummary methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:03'!
reportForTransferDepositLeg: aTransferDepositLeg
	
	^('Entrada por transferencia de ',(aTransferDepositLeg value) asString).! !

!AccountSummary methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:12'!
reportForTransferWithdrawLeg: aTransferWithdrawLeg
	
	^('Salida por transferencia de ',(aTransferWithdrawLeg value) asString).! !

!AccountSummary methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:28'!
reportForWithdraw: aWithdraw
	
	^('Extracción por ',(aWithdraw value) asString)! !


!AccountSummary methodsFor: 'initialize' stamp: 'RA 11/14/2022 17:14:05'!
initializeWith: anAccount

	account := anAccount.
	summaryMovements := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Parte2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'RA 11/16/2022 00:06:12'!
with: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #SpecialReport category: 'ServiciosFinancieros-Parte2'!
Report subclass: #SpecialReport
	instanceVariableNames: 'spaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!SpecialReport methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:46:29'!
reportForPortfolio: aPortfolio

	self subclassResponsibility.! !

!SpecialReport methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:46:43'!
reportForReceptiveAccount: aReceptiveAccount

	self subclassResponsibility.! !


!SpecialReport methodsFor: 'private' stamp: 'RA 11/18/2022 11:51:26'!
addNameOfAccount: anAccountName to: aCollection

	aCollection add: anAccountName.! !

!SpecialReport methodsFor: 'private' stamp: 'RA 11/18/2022 11:49:36'!
correspondingSpaces
	
	| finalString |
	finalString := String new.
	spaces timesRepeat: [finalString := finalString, ' '].
	
	^finalString.! !

!SpecialReport methodsFor: 'private' stamp: 'RA 11/18/2022 11:48:39'!
decreaseSpaces
	
	spaces := spaces - 2.! !

!SpecialReport methodsFor: 'private' stamp: 'RA 11/18/2022 11:54:17'!
identAndAddAccountsFrom: aPortfolio to: aCollection

	self subclassResponsibility.! !

!SpecialReport methodsFor: 'private' stamp: 'RA 11/18/2022 11:47:58'!
increaseSpaces
	
	spaces := spaces + 2.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Parte2'!
SpecialReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'portfolio detailedTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioDetailedTreePrinter methodsFor: 'initialize' stamp: 'RA 11/17/2022 14:21:26'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	detailedTree := OrderedCollection new.
	spaces := 2.! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'RA 11/18/2022 11:29:54'!
addAccountSummaryFrom: anAccount to: aCollection

	self increaseSpaces.
	(AccountSummary with: anAccount) report do: [:aReportLine | aCollection add: self correspondingSpaces,aReportLine].
	self decreaseSpaces.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'RA 11/18/2022 11:27:38'!
identAndAddAccountsFrom: aPortfolio to: aCollection

	self increaseSpaces.
	aPortfolio accounts do:[:anAccount | aCollection addAllLast: (anAccount reportFor: self)].
	aCollection add: self correspondingSpaces,'Balance = ',(aPortfolio balance) asString.
	self decreaseSpaces.
	! !


!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
report

	self addNameOfAccount: (portfolio name) to: detailedTree.
	
	portfolio accounts do:[:anAccount | detailedTree addAllLast: (anAccount reportFor: self)].
	detailedTree add: '  Balance = ',(portfolio balance) asString.
	
	^detailedTree.! !

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
reportForPortfolio: aPortfolio
	
	| linesForPortfolio |
	
	linesForPortfolio := OrderedCollection new.
	self addNameOfAccount: (self correspondingSpaces,aPortfolio name) to: linesForPortfolio.
	
	self identAndAddAccountsFrom: aPortfolio to: linesForPortfolio.
	^linesForPortfolio .! !

!PortfolioDetailedTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
reportForReceptiveAccount: anAccount
	
	| linesForReceptiveAccount |
	
	linesForReceptiveAccount := OrderedCollection new.
	self addNameOfAccount: (self correspondingSpaces,anAccount name) to: linesForReceptiveAccount.
	
	self addAccountSummaryFrom: anAccount to: linesForReceptiveAccount.
	^linesForReceptiveAccount.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Parte2'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'instance creation' stamp: 'RA 11/17/2022 14:20:58'!
for: aPortfolio

	^self new initializeWith: aPortfolio.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Parte2'!
SpecialReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreePrinter methodsFor: 'initialize' stamp: 'AC 11/16/2022 17:48:44'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	tree := OrderedCollection new.
	spaces := 2.! !


!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
report

	self addNameOfAccount: (portfolio name) to: tree.
	portfolio accounts do:[:anAccount | tree addAllLast: (anAccount reportFor: self)].
	
	^tree! !

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
reportForPortfolio: aPortfolio
	
	| linesForPortfolio |
	
	linesForPortfolio := OrderedCollection new.
	self addNameOfAccount: (self correspondingSpaces,aPortfolio name) to: linesForPortfolio.
	
	self identAndAddAccountsFrom: aPortfolio to: linesForPortfolio.
	
	^linesForPortfolio .! !

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'RA 11/18/2022 11:50:33'!
reportForReceptiveAccount: anAccount
	
	| linesForReceptiveAccount |
	
	linesForReceptiveAccount := OrderedCollection new.
	self addNameOfAccount: (self correspondingSpaces,anAccount name) to: linesForReceptiveAccount.
	
	^linesForReceptiveAccount.
! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'RA 11/18/2022 11:17:11'!
identAndAddAccountsFrom: aPortfolio to: aCollection

	self increaseSpaces.
	aPortfolio accounts do:[:anAccount | aCollection addAllLast: (anAccount reportFor: self) ].
	self decreaseSpaces.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Parte2'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'RA 11/17/2022 14:20:53'!
for: aPortfolio

	^self new initializeWith: aPortfolio.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Parte2'!
Report subclass: #TransferNet
	instanceVariableNames: 'account netSummary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferNet methodsFor: 'main protocol' stamp: 'RA 11/18/2022 12:02:39'!
report
	
	account forTransactionsDo: [:aTransfer | netSummary := aTransfer reportFor: self].
	^netSummary.! !

!TransferNet methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:03'!
reportForTransferDepositLeg: aTransferDepositLeg
	
	^(netSummary + (aTransferDepositLeg) value).! !

!TransferNet methodsFor: 'main protocol' stamp: 'RA 11/16/2022 13:13:12'!
reportForTransferWithdrawLeg: aTransferWithdrawLeg
	
	^(netSummary - (aTransferWithdrawLeg) value).! !


!TransferNet methodsFor: 'initialize' stamp: 'RA 11/13/2022 20:05:08'!
initializeWith: anAccount

	account := anAccount.
	netSummary := 0 * peso.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Parte2'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'RA 11/16/2022 00:06:13'!
with: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Parte2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
