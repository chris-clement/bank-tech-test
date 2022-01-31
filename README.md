# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

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

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=individual_challenges/bank_tech_test.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=individual_challenges/bank_tech_test.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=individual_challenges/bank_tech_test.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=individual_challenges/bank_tech_test.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=individual_challenges/bank_tech_test.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->


# Planning

1. Set up deposit method. This will include a balance variable. Not date to begin with. :white_check_mark:
2. Add a debit variable which will be updated when a deposit is made. :white_check_mark:
3. Add a withdrawal method. :white_check_mark:
4. Add a credit variable. This will update once a withdrawal is made. :white_check_mark:
5. Add a date element. So deposits and withdrawals are made on a certain date. :white_check_mark:
6. make a array of hashes to store this information. So every time a withdrawal or deposit is made this is stored. :white_check_mark:
7. Add a print_account_summary method to display the history. :white_check_mark:

# Classes and Method names.

- Class Bank.
- Methods: deposit, withdraw, print_account_summary, add_to_history.
- Variables: balance(integer), date(date), credit(integer), debit(integer),history (array of hashes)
- How to store this info? Array of hashes for the history e.g. 
[{date: 28/01/2022, balance: 2500, credit: 0, debit: 500}, {date: 31/01/2022, balance: 3500, credit: 0, debit: 1000}]
- Sorting the array of hashes seems straight forward using
array.sort_by! { |transaction| transaction["date"]}.

# Edge Cases to consider

- withdraw with non-positive number => Error Thrown :white_check_mark:
- deposit with non-positive number => Error Thrown :white_check_mark:
- Can balance fall below 0 => Assuming yes for now. Overdraft limits could be introduced if needed. :white_check_mark:
- What if date is not in right format. 
- Date is in the future => Fine as shown in acceptance criteria. :white_check_mark:
- Date is not given => Default value of today is used :white_check_mark:
- print_summary is called before any deposits/withdrawals take place => Just the headers are printed :white_check_mark:
- deposit a non-integer => Error Thrown
- withdraw a non-integer => Error Thrown
