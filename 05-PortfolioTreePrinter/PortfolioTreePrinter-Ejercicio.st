!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated
	| temp1 |
	temp1 _ ReceptiveAccount new.
	self assert: 0 = temp1 balance.! !

!PortfolioTest methodsFor: 'tests'!
test02DepositIncreasesBalanceOnTransactionValue
	| temp1 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	self assert: 100 = temp1 balance.! !

!PortfolioTest methodsFor: 'tests'!
test03WithdrawDecreasesBalanceOnTransactionValue
	| temp1 |
	temp1 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	self assert: 50 = temp1 balance.! !

!PortfolioTest methodsFor: 'tests'!
test03_01WithdrawValueMustBePositive
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ 50.
	self
		assert:
			(Withdraw
				register: temp2
				on: temp1) value
		equals: temp2.! !

!PortfolioTest methodsFor: 'tests'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ Portfolio
		with: temp1
		with: temp2.
	Deposit
		register: 100
		on: temp1.
	Deposit
		register: 200
		on: temp2.
	self assert: 300 = temp3 balance.! !

!PortfolioTest methodsFor: 'tests'!
test05PortfolioCanManagePortfolios
	| temp1 temp2 temp3 temp4 temp5 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	Deposit
		register: 100
		on: temp1.
	Deposit
		register: 200
		on: temp2.
	Deposit
		register: 300
		on: temp3.
	self assert: 600 = temp5 balance.! !

!PortfolioTest methodsFor: 'tests'!
test06ReceptiveAccountKnowsRegisteredTransactions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit
		register: 100
		on: temp1.
	temp3 _ Withdraw
		register: 50
		on: temp1.
	self assert: (temp1 registers: temp2).
	self assert: (temp1 registers: temp3).! !

!PortfolioTest methodsFor: 'tests'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit for: 100.
	temp3 _ Withdraw for: 50.
	self deny: (temp1 registers: temp2).
	self deny: (temp1 registers: temp3).! !

!PortfolioTest methodsFor: 'tests'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Deposit
		register: 100
		on: temp1.
	temp7 _ Deposit
		register: 200
		on: temp2.
	temp8 _ Deposit
		register: 300
		on: temp3.
	self assert: (temp5 registers: temp6).
	self assert: (temp5 registers: temp7).
	self assert: (temp5 registers: temp8).! !

!PortfolioTest methodsFor: 'tests'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Deposit
		register: 100
		on: temp1.
	temp7 _ Deposit
		register: 200
		on: temp2.
	temp8 _ Deposit
		register: 300
		on: temp3.
	self assert: (temp5 registers: temp6).
	self assert: (temp5 registers: temp7).
	self assert: (temp5 registers: temp8).! !

!PortfolioTest methodsFor: 'tests'!
test10ReceptiveAccountManageItSelf
	| temp1 |
	temp1 _ ReceptiveAccount new.
	self assert: (temp1 manages: temp1).! !

!PortfolioTest methodsFor: 'tests'!
test11ReceptiveAccountDoNotManageOtherAccount
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	self deny: (temp1 manages: temp2).! !

!PortfolioTest methodsFor: 'tests'!
test12PortfolioManagesComposedAccounts
	| temp1 temp2 temp3 temp4 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	self assert: (temp4 manages: temp1).
	self assert: (temp4 manages: temp2).
	self deny: (temp4 manages: temp3).! !

!PortfolioTest methodsFor: 'tests'!
test13PortfolioManagesComposedAccountsAndPortfolios
	| temp1 temp2 temp3 temp4 temp5 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	self assert: (temp5 manages: temp1).
	self assert: (temp5 manages: temp2).
	self assert: (temp5 manages: temp3).
	self assert: (temp5 manages: temp4).! !

!PortfolioTest methodsFor: 'tests'!
test14AccountKnowsItsTransactions
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ Deposit
		register: 100
		on: temp1.
	self assert: 1 = temp1 transactions size.
	self assert: (temp1 transactions includes: temp2).! !

!PortfolioTest methodsFor: 'tests'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp6 _ Portfolio
		with: temp4
		with: temp3.
	temp7 _ Deposit
		register: 100
		on: temp1.
	temp8 _ Deposit
		register: 200
		on: temp2.
	temp9 _ Deposit
		register: 300
		on: temp3.
	self assert: 3 = temp6 transactions size.
	self assert: (temp6 transactions includes: temp7).
	self assert: (temp6 transactions includes: temp8).
	self assert: (temp6 transactions includes: temp9).! !

!PortfolioTest methodsFor: 'tests'!
test16PortfolioKnowsItsAccountsTransactions
	| temp1 temp2 temp3 temp4 temp5 temp6 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Deposit
		register: 100
		on: temp1.
	self assert: 1 = (temp5 transactionsOf: temp1) size.
	self assert: ((temp5 transactionsOf: temp1) includes: temp6).! !

!PortfolioTest methodsFor: 'tests'!
test17PortfolioKnowsItsPortfoliosTransactions
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Deposit
		register: 100
		on: temp1.
	temp7 _ Deposit
		register: 100
		on: temp2.
	Deposit
		register: 100
		on: temp3.
	self assert: 2 = (temp5 transactionsOf: temp4) size.
	self assert: ((temp5 transactionsOf: temp4) includes: temp6).
	self assert: ((temp5 transactionsOf: temp4) includes: temp7).! !

!PortfolioTest methodsFor: 'tests'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts
	| temp1 temp2 temp3 temp4 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	self
		should: [ temp4 transactionsOf: temp3 ]
		raise: Error
		withExceptionDo: [ :arg5 |
			self assert: Portfolio accountNotManagedMessageDescription = arg5 messageText ].! !

!PortfolioTest methodsFor: 'tests'!
test19CanNotCreatePortfoliosWithRepeatedAccount
	| temp1 |
	temp1 _ ReceptiveAccount new.
	self
		should: [
			Portfolio
				with: temp1
				with: temp1 ]
		raise: Error
		withExceptionDo: [ :arg2 |
			self assert: Portfolio accountAlreadyManagedErrorMessage = arg2 messageText ].! !

!PortfolioTest methodsFor: 'tests'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ Portfolio
		with: temp1
		with: temp2.
	self
		should: [
			Portfolio
				with: temp3
				with: temp1 ]
		raise: Error
		withExceptionDo: [ :arg4 |
			self assert: Portfolio accountAlreadyManagedErrorMessage = arg4 messageText ].! !

!PortfolioTest methodsFor: 'tests'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo
	| temp1 temp2 temp3 temp4 temp5 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp3
		with: temp1.
	self
		should: [
			Portfolio
				with: temp4
				with: temp5 ]
		raise: Error
		withExceptionDo: [ :arg6 |
			self assert: Portfolio accountAlreadyManagedErrorMessage = arg6 messageText ].! !

!PortfolioTest methodsFor: 'tests'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	self assert: -100 = temp1 balance.
	self assert: 100 = temp2 balance.! !

!PortfolioTest methodsFor: 'tests'!
test21_01TransferIsReachedFromTransacctions
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ Transfer
		register: 100
		from: temp1
		to: temp2.
	self assert: 100 = temp3 value.
	self
		assert: temp1 transactions first transfer
		equals: temp3.
	self
		assert: temp2 transactions first transfer
		equals: temp3.! !

!PortfolioTest methodsFor: 'tests'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail
	| temp1 temp2 temp3 temp4 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	temp3 _ self accountSummaryLinesOf: temp1.
	temp4 _ self accountSummaryLinesOf: temp2.
	self assert: 3 = temp3 size.
	self assert: 'Deposito por 100' = (temp3 at: 1).
	self assert: 'Extraccion por 50' = (temp3 at: 2).
	self assert: 'Transferencia por -100' = (temp3 at: 3).
	self assert: 1 = temp4 size.
	self assert: 'Transferencia por 100' = (temp4 at: 1).! !

!PortfolioTest methodsFor: 'tests'!
test23ShouldBeAbleToBeQueryTransferNet
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	Transfer
		register: 250
		from: temp2
		to: temp1.
	self assert: 150 = (self accountTransferNetOf: temp1).
	self assert: -150 = (self accountTransferNetOf: temp2).! !

!PortfolioTest methodsFor: 'tests'!
test24CertificateOfDepositShouldWithdrawInvestmentValue
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 1000
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	CertificateOfDeposit
		register: 100
		during: 30
		at: 1 / 10
		on: temp1.
	self assert: 100 = (self investmentNetOf: temp1).
	self assert: 750 = temp1 balance.! !

!PortfolioTest methodsFor: 'tests'!
test25ShouldBeAbleToQueryInvestmentEarnings
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	CertificateOfDeposit
		register: 100
		during: 30
		at: 1 / 10
		on: temp1.
	CertificateOfDeposit
		register: 100
		during: 60
		at: 15 / 100
		on: temp1.
	temp2 _ 100 * (1 / 10 / 360) * 30 + (100 * (15 / 100 / 360) * 60).
	self assert: temp2 = (self investmentEarningsOf: temp1).! !

!PortfolioTest methodsFor: 'tests'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit
	| temp1 temp2 temp3 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	CertificateOfDeposit
		register: 1000
		during: 30
		at: 1 / 10
		on: temp1.
	temp3 _ self accountSummaryLinesOf: temp1.
	self assert: 4 = temp3 size.
	self assert: 'Deposito por 100' = (temp3 at: 1).
	self assert: 'Extraccion por 50' = (temp3 at: 2).
	self assert: 'Transferencia por -100' = (temp3 at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (temp3 at: 4).! !

!PortfolioTest methodsFor: 'tests'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit
	| temp1 temp2 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	Deposit
		register: 100
		on: temp1.
	Withdraw
		register: 50
		on: temp1.
	Transfer
		register: 100
		from: temp1
		to: temp2.
	Transfer
		register: 250
		from: temp2
		to: temp1.
	CertificateOfDeposit
		register: 1000
		during: 30
		at: 1 / 10
		on: temp1.
	self assert: 150 = (self accountTransferNetOf: temp1).
	self assert: -150 = (self accountTransferNetOf: temp2).! !

!PortfolioTest methodsFor: 'tests'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Dictionary new.
	temp6
		at: temp5
		put: 'composedPortfolio'.
	temp6
		at: temp4
		put: 'complexPortfolio'.
	temp6
		at: temp1
		put: 'account1'.
	temp6
		at: temp2
		put: 'account2'.
	temp6
		at: temp3
		put: 'account3'.
	temp7 _ self
		portofolioTreeOf: temp5
		namingAccountWith: temp6.
	self assert: 5 = temp7 size.
	self assert: 'composedPortfolio' = (temp7 at: 1).
	self assert: ' complexPortfolio' = (temp7 at: 2).
	self assert: '  account1' = (temp7 at: 3).
	self assert: '  account2' = (temp7 at: 4).
	self assert: ' account3' = (temp7 at: 5).! !

!PortfolioTest methodsFor: 'tests'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves
	| temp1 temp2 temp3 temp4 temp5 temp6 temp7 |
	temp1 _ ReceptiveAccount new.
	temp2 _ ReceptiveAccount new.
	temp3 _ ReceptiveAccount new.
	temp4 _ Portfolio
		with: temp1
		with: temp2.
	temp5 _ Portfolio
		with: temp4
		with: temp3.
	temp6 _ Dictionary new.
	temp6
		at: temp5
		put: 'composedPortfolio'.
	temp6
		at: temp4
		put: 'complexPortfolio'.
	temp6
		at: temp1
		put: 'account1'.
	temp6
		at: temp2
		put: 'account2'.
	temp6
		at: temp3
		put: 'account3'.
	temp7 _ self
		reversePortofolioTreeOf: temp5
		namingAccountWith: temp6.
	self assert: 5 = temp7 size.
	self assert: ' account3' = (temp7 at: 1).
	self assert: '  account2' = (temp7 at: 2).
	self assert: '  account1' = (temp7 at: 3).
	self assert: ' complexPortfolio' = (temp7 at: 4).
	self assert: 'composedPortfolio' = (temp7 at: 5).! !


!PortfolioTest methodsFor: 'test support' stamp: 'CZ 5/14/2018 19:22:19'!
accountSummaryLinesOf: arg1
	^ (AccountSummary of: arg1) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'CZ 5/14/2018 19:34:19'!
accountTransferNetOf: arg1
	^(TransferNet of: arg1) value.
	! !

!PortfolioTest methodsFor: 'test support'!
investmentEarningsOf: arg1
	^ arg1 investments
		inject: 0
		into: [ :arg2 :arg3 |
			arg2 + arg3 earning ].! !

!PortfolioTest methodsFor: 'test support'!
investmentNetOf: arg1
	^ arg1 investments
		inject: 0
		into: [ :arg2 :arg3 |
			arg2 + arg3 value ].! !

!PortfolioTest methodsFor: 'test support'!
portofolioTreeOf: arg1 namingAccountWith: arg2
	self shouldBeImplemented.! !

!PortfolioTest methodsFor: 'test support'!
reversePortofolioTreeOf: arg1 namingAccountWith: arg2
	self shouldBeImplemented.! !


!classDefinition: #AccountSummary category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountSummary
	instanceVariableNames: 'lines account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 18:59:46'!
initializeOf: arg1
	account _ arg1.
	lines := OrderedCollection new.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 19:02:17'!
value
	account x: self.
	^lines.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 19:02:09'!
valueOfTransaction: aTransaction
	lines add: (aTransaction toString).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified'!
of: arg1
	^ self new initializeOf: arg1.! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating'!
affectBalance: arg1
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'evaluating'!
value
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'as yet unclassified'!
toString
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation'!
register: arg1 on: arg2
	| temp3 |
	temp3 _ self for: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization'!
initializeFor: arg1 during: arg2 withRate: arg3 on: arg4
	value _ arg1.
	numberOfDays _ arg2.
	tna _ arg3.
	account _ arg4.! !


!CertificateOfDeposit methodsFor: 'print'!
toString
	^ 'Plazo fijo por ' , self value printString , ' durante ' , self numberOfDays printString , ' dias a una tna de ' , (self tna * 100) printString , '%'.! !


!CertificateOfDeposit methodsFor: 'value'!
affectBalance: arg1
	^ arg1 - self value.! !

!CertificateOfDeposit methodsFor: 'value'!
numberOfDays
	^ numberOfDays.! !

!CertificateOfDeposit methodsFor: 'value'!
tna
	^ tna.! !

!CertificateOfDeposit methodsFor: 'value'!
value
	^ value.! !


!CertificateOfDeposit methodsFor: 'testing'!
earning
	^ self value * (self tna / 360) * self numberOfDays.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation'!
for: arg1 during: arg2 withRate: arg3 on: arg4
	^ self new
		initializeFor: arg1
		during: arg2
		withRate: arg3
		on: arg4.! !

!CertificateOfDeposit class methodsFor: 'instance creation'!
register: arg1 during: arg2 at: arg3 on: arg4
	| temp5 |
	temp5 _ self
		for: arg1
		during: arg2
		withRate: arg3
		on: arg4.
	arg4 register: temp5.
	^ temp5.! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization'!
initializeFor: arg1
	value _ arg1.! !


!Deposit methodsFor: 'value'!
affectBalance: arg1
	^ arg1 + self value.! !

!Deposit methodsFor: 'value'!
value
	^ value.! !


!Deposit methodsFor: 'print'!
toString
	^ 'Deposito por ' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation'!
for: arg1
	^ self new initializeFor: arg1.! !

!Deposit class methodsFor: 'instance creation'!
register: arg1 on: arg2
	| temp3 |
	temp3 _ self for: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
Deposit subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'initialization'!
initializeAssociatedWith: arg1
	value _ arg1 value.
	transfer _ arg1.! !


!TransferDeposit methodsFor: 'transfer'!
transfer
	^ transfer.! !


!TransferDeposit methodsFor: 'print'!
toString
	^ 'Transferencia por ' , (self affectBalance: 0) printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation'!
associatedWith: arg1
	^ self new initializeAssociatedWith: arg1.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization'!
initializeFor: arg1
	value _ arg1.! !


!Withdraw methodsFor: 'value'!
affectBalance: arg1
	^ arg1 - self value.! !

!Withdraw methodsFor: 'value'!
value
	^ value.! !


!Withdraw methodsFor: 'print'!
toString
	^ 'Extraccion por ' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation'!
for: arg1
	^ self new initializeFor: arg1.! !

!Withdraw class methodsFor: 'instance creation'!
register: arg1 on: arg2
	| temp3 |
	temp3 _ self for: arg1.
	arg2 register: temp3.
	^ temp3.! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'transfer'!
transfer
	^ transfer.! !


!TransferWithdraw methodsFor: 'initialization'!
initializeAssociatedWith: arg1
	value _ arg1 value.
	transfer _ arg1.! !


!TransferWithdraw methodsFor: 'print'!
toString
	^ 'Transferencia por ' , (self affectBalance: 0) printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation'!
associatedWith: arg1
	^ self new initializeAssociatedWith: arg1.! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing'!
manages: arg1
	self subclassResponsibility.! !

!SummarizingAccount methodsFor: 'testing'!
registers: arg1
	self subclassResponsibility.! !


!SummarizingAccount methodsFor: 'transactions'!
balance
	self subclassResponsibility.! !

!SummarizingAccount methodsFor: 'transactions'!
transactions
	self subclassResponsibility.! !


!SummarizingAccount methodsFor: 'print'!
accountSummary
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing'!
anyManagedAccountManages: arg1
	^ accounts anySatisfy: [ :arg2 |
		(arg2 anyManagedAccountManages: arg1) or: [ arg1 anyManagedAccountManages: arg2 ]].! !

!Portfolio methodsFor: 'testing'!
manages: arg1
	^ self = arg1 or: [
		accounts anySatisfy: [ :arg2 |
			arg2 manages: arg1 ]].! !

!Portfolio methodsFor: 'testing'!
registers: arg1
	^ accounts anySatisfy: [ :arg2 |
		arg2 registers: arg1 ].! !


!Portfolio methodsFor: 'transactions'!
balance
	^ accounts sum: [ :arg1 |
		arg1 balance ].! !

!Portfolio methodsFor: 'transactions'!
transactions
	^ accounts
		inject: OrderedCollection new
		into: [ :arg1 :arg2 |
			arg1 addAll: arg2 transactions.
			arg1 ].! !

!Portfolio methodsFor: 'transactions'!
transactionsOf: arg1
	^ (self manages: arg1)
		ifTrue: [ arg1 transactions ]
		ifFalse: [ self error: self class accountNotManagedMessageDescription ].! !


!Portfolio methodsFor: 'initialization'!
initializeWithAll: arg1
	accounts _ arg1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation'!
with: arg1 with: arg2
	^ self withAll:
		(Array
			with: arg1
			with: arg2).! !

!Portfolio class methodsFor: 'instance creation'!
withAll: arg1
	arg1 asSet size = arg1 size ifFalse: [ self error: self accountAlreadyManagedErrorMessage ].
	arg1 do: [ :arg2 |
		arg1 do: [ :arg3 |
			(arg2 = arg3) not ifTrue: [
				(arg2 anyManagedAccountManages: arg3) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ]]]].
	^ self new initializeWithAll: arg1.! !


!Portfolio class methodsFor: 'assertions'!
check: arg1 doesNotManagaAnyOf: arg2
	^ arg2 do: [ :arg3 |
		(arg1 = arg3) not ifTrue: [
			(arg1 manages: arg3) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ]]].! !

!Portfolio class methodsFor: 'assertions'!
checkAccountsAreUnique: arg1
	arg1 asSet size = arg1 size ifFalse: [ self error: self accountAlreadyManagedErrorMessage ].! !

!Portfolio class methodsFor: 'assertions'!
checkCreationPreconditions: arg1
	self checkAccountsAreUnique: arg1.
	self checkNoCircularReferencesIn: arg1.! !

!Portfolio class methodsFor: 'assertions'!
checkNoCircularReferencesIn: arg1
	arg1 do: [ :arg2 |
		self
			check: arg2
			doesNotManagaAnyOf: arg1 ].! !


!Portfolio class methodsFor: 'error messages'!
accountAlreadyManagedErrorMessage
	^ 'Account already managed'.! !

!Portfolio class methodsFor: 'error messages'!
accountNotManagedMessageDescription
	^ 'Account not managed'.! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization'!
initialize
	super initialize.
	transactions _ OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions'!
balance
	^ transactions
		inject: 0
		into: [ :arg1 :arg2 |
			arg2 affectBalance: arg1 ].! !

!ReceptiveAccount methodsFor: 'transactions'!
register: arg1
	transactions add: arg1.! !

!ReceptiveAccount methodsFor: 'transactions'!
transactions
	^ transactions copy.! !


!ReceptiveAccount methodsFor: 'testing'!
anyManagedAccountManages: arg1
	^ (self manages: arg1) or: [ arg1 manages: self ].! !

!ReceptiveAccount methodsFor: 'testing'!
investments
	^ self transactions select: [ :arg1 |
		arg1 isKindOf: CertificateOfDeposit ].! !

!ReceptiveAccount methodsFor: 'testing'!
manages: arg1
	^ self = arg1.! !

!ReceptiveAccount methodsFor: 'testing'!
registers: arg1
	^ transactions includes: arg1.! !

!ReceptiveAccount methodsFor: 'testing'!
transfers
	^ self transactions select: [ :arg1 |
		(arg1 isKindOf: TransferDeposit) or: (arg1 isKindOf: TransferWithdraw) ].! !


!ReceptiveAccount methodsFor: 'print' stamp: 'CZ 5/14/2018 19:00:12'!
x: arg1
	transactions do: [:arg2 | arg1 valueOfTransaction: arg2 ].! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'from to value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization'!
initializeFor: arg1 from: arg2 to: arg3
	value _ arg1.
	from _ arg2.
	to _ arg3.! !


!Transfer methodsFor: 'value'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation'!
for: arg1 from: arg2 to: arg3
	^ self new
		initializeFor: arg1
		from: arg2
		to: arg3.! !

!Transfer class methodsFor: 'instance creation'!
register: arg1 from: arg2 to: arg3
	| temp4 temp5 temp6 |
	temp4 _ self
		for: arg1
		from: arg2
		to: arg3.
	temp5 _ TransferWithdraw associatedWith: temp4.
	temp6 _ TransferDeposit associatedWith: temp4.
	arg2 register: temp5.
	arg3 register: temp6.
	^ temp4.! !


!classDefinition: #TransferNet category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #TransferNet
	instanceVariableNames: 'net account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 19:15:25'!
initializeOf: anAccount
	account  := anAccount.
	net := 0.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 19:04:48'!
value
	account x: self.
	^net.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 19:42:45'!
valueOfTransaction: aTransaction
	net := ((aTransaction isKindOf: TransferWithdraw)  or: (aTransaction isKindOf: TransferDeposit ) )
		ifTrue:[ aTransaction affectBalance: net]
		ifFalse: [net].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'CZ 5/14/2018 18:46:35'!
of: anAccount
	^ self new initializeOf: anAccount ! !
