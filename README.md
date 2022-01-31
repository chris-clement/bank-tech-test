# Bank tech test

### What this is?

A simple Bank tech app to be used within irb to create a bank account, deposit amounts, withdraw amounts and get a transaction summary printed to the console.

### Built with

- Ruby

### How to run

```
git clone https://github.com/chris-clement/bank-tech-test.git
cd bank-tech-test
bundle install
irb -r "./lib/bank.rb"
require 'date'
```

### How to use

Open a new account using bank = Bank.new

```
bank = Bank.new
3.0.0 :001 > bank = Bank.new
 => #<Bank:0x0000000... 
3.0.0 :002 > bank
 => 
#<Bank:0x000000014417b368 
 @balance=0,              
 @credit=0,               
 @debit=0,                
 @history=[]> 
```
Make a deposit using bank.deposit() with the amount and date entered.

```
bank.deposit(50, Date.new(
2021,12,31))
 => 
[{:date=>                              
   #<Date: 2021-12-31 ((2459580j,0s,0n),+0s,2299161j)>,                       
  :credit=>50,                         
  :debit=>0,                           
  :balance=>50}]                       
```
By default if no date is provided today's date is used.

```
bank.deposit(100)
 => 
[{:date=>                              
   #<Date: 2021-12-31 ((2459580j,0s,0n),+0s,2299161j)>,                       
  :credit=>50,                         
  :debit=>0,                           
  :balance=>50},                       
 {:date=>                              
   #<Date: 2022-01-31 ((2459611j,0s,0n),+0s,2299161j)>,                       
  :credit=>100,                        
  :debit=>0,                           
  :balance=>150}]                      
```

Use bank.withdraw() to make a withdrawal for an amount and date.
```
bank.withdraw(70, Date.new
(2022,2,1))
 => 
[{:date=>                              
   #<Date: 2021-12-31 ((2459580j,0s,0n),+0s,2299161j)>,                       
  :credit=>50,                         
  :debit=>0,                           
  :balance=>50},                       
 {:date=>                              
   #<Date: 2022-01-31 ((2459611j,0s,0n),+0s,2299161j)>,                       
  :credit=>100,                        
  :debit=>0,                           
  :balance=>150},                      
 {:date=>                              
   #<Date: 2022-02-01 ((2459612j,0s,0n),+0s,2299161j)>,
  :credit=>0,
  :debit=>70,
  :balance=>80}] 
```
By default if no date is provided today's date is used.
```
bank.withdraw(15)
 => 
[{:date=>                              
   #<Date: 2021-12-31 ((2459580j,0s,0n),+0s,2299161j)>,                       
  :credit=>50,                         
  :debit=>0,                           
  :balance=>50},                       
 {:date=>                              
   #<Date: 2022-01-31 ((2459611j,0s,0n),+0s,2299161j)>,                       
  :credit=>100,                        
  :debit=>0,                           
  :balance=>150},                      
 {:date=>                              
   #<Date: 2022-02-01 ((2459612j,0s,0n),+0s,2299161j)>,
  :credit=>0,
  :debit=>70,
  :balance=>80},
 {:date=>
   #<Date: 2022-01-31 ((2459611j,0s,0n),+0s,2299161j)>,
  :credit=>0,
  :debit=>15,
  :balance=>65}] 
```
Use bank.print_summary to print to the console a history of transaction sorted by new to old.
```
bank.print_summary
date || credit || debit || balance
 01/02/2022 || || 70.00 || 80.00       
 31/01/2022 || || 15.00 || 65.00       
 31/01/2022 || 100.00 || || 150.00     
 31/12/2021 || 50.00 || || 50.00       
 ```   

 This displays the date of the transaction, whether it was a Credit (Income i.e. Money coming into the account) or Debit (Expense i.e. Money coming out of the account), and the balance on the account.


## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit

## Planning

1. Set up deposit method. This will include a balance variable. Not date to begin with. :white_check_mark:
2. Add a debit variable which will be updated when a deposit is made. :white_check_mark:
3. Add a withdrawal method. :white_check_mark:
4. Add a credit variable. This will update once a withdrawal is made. :white_check_mark:
5. Add a date element. So deposits and withdrawals are made on a certain date. :white_check_mark:
6. make a array of hashes to store this information. So every time a withdrawal or deposit is made this is stored. :white_check_mark:
7. Add a print_account_summary method to display the history. :white_check_mark:

### Classes and Method names.

- Class Bank.
- Methods: deposit, withdraw, print_account_summary, add_to_history.
- Variables: balance(integer), date(date), credit(integer), debit(integer),history (array of hashes)
- How to store this info? Array of hashes for the history e.g. 
[{date: 28/01/2022, balance: 2500, credit: 0, debit: 500}, {date: 31/01/2022, balance: 3500, credit: 0, debit: 1000}]
- Sorting the array of hashes seems straight forward using
array.sort_by! { |transaction| transaction["date"]}.

### Edge Cases to consider

- withdraw with non-positive number => Error Thrown :white_check_mark:
- deposit with non-positive number => Error Thrown :white_check_mark:
- Can balance fall below 0 => Assuming yes for now. Overdraft limits could be introduced if needed. :white_check_mark:
- What if date is not in right format. 
- Date is in the future => Fine as shown in acceptance criteria. :white_check_mark:
- Date is not given => Default value of today is used :white_check_mark:
- print_summary is called before any deposits/withdrawals take place => Just the headers are printed :white_check_mark:
- deposit a non-integer => Error Thrown :white_check_mark:
- withdraw a non-integer => Error Thrown :white_check_mark:
