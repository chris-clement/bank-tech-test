# frozen_string_literal: true

require 'bank'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end
  it('starts with a balance of 0') do
    expect(@bank.balance).to equal 0
  end

  describe('#deposit') do
    it('Is a method within the Bank class') do
      expect(@bank).to respond_to :deposit
    end
    it('Increases the balance by the amount deposited') do
      expect { @bank.deposit(50) }.to change { @bank.balance }.by 50
    end
    it('Updates the credit variable to equal the amount desposited') do
      @bank.deposit(50)
      expect(@bank.credit).to equal 50
    end
    it('Updates the credit variable to only the latest amount desposited') do
      @bank.deposit(50)
      @bank.deposit(20)
      expect(@bank.credit).to equal 20
    end
    it('The debit variable is set to 0 after a deposit is made') do
      @bank.withdraw(30)
      @bank.deposit(10)
      expect(@bank.debit).to equal 0
    end
    it('Deposits have an associated date, this defaults to today if one is not provided') do
      @bank.deposit(100)
      expect(@bank.date.day).to equal Date.today.day
      expect(@bank.date.month).to equal Date.today.month
      expect(@bank.date.year).to equal Date.today.year
    end
    it('Deposits have an associated date') do
      @bank.deposit(100, Date.new(2021, 7, 6))
      expect(@bank.date.day).to equal 6
      expect(@bank.date.month).to equal 7
      expect(@bank.date.year).to equal 2021
    end
    it('Throws an error if you deposit a non-positive integer') do
      expect { @bank.deposit(-20) }.to raise_error 'Cannot withdraw/deposit a non-positive amount.'
    end
    it('Throws an error if you enter a date which is not a date') do
      expect { @bank.deposit(50, '31/02/2021') }.to raise_error 'That date is not recognised, please try again.'
    end
    it('Throws an error if you enter a amount which is not a integer') do
      expect { @bank.deposit('six') }.to raise_error 'That amount is not recognised as a value, please try again.'
    end
  end

  describe('#withdraw') do
    it('Is a method within the Bank class') do
      expect(@bank).to respond_to :withdraw
    end
    it('Reduces the balance by the amount withdrawn') do
      expect { @bank.withdraw(50) }.to change { @bank.balance }.by(-50)
    end
    it('Updates the debit variable to equal the amount withdrawn') do
      @bank.withdraw(50)
      expect(@bank.debit).to equal 50
    end
    it('Updates the debit variable to only the latest amount withdrawn') do
      @bank.withdraw(50)
      @bank.withdraw(20)
      expect(@bank.debit).to equal 20
    end
    it('The credit variable is set to 0 after a withdrawal is made') do
      @bank.deposit(10)
      @bank.withdraw(30)
      expect(@bank.credit).to equal 0
    end
    it('has an associated date, this defaults to today if one is not provided') do
      @bank.withdraw(100)
      expect(@bank.date.day).to equal Date.today.day
      expect(@bank.date.month).to equal Date.today.month
      expect(@bank.date.year).to equal Date.today.year
    end
    it('has an associated date') do
      @bank.withdraw(100, Date.new(2021, 7, 6))
      expect(@bank.date.day).to equal 6
      expect(@bank.date.month).to equal 7
      expect(@bank.date.year).to equal 2021
    end
    it('Throws an error if you withdraw a non-positive integer') do
      expect { @bank.withdraw(-20) }.to raise_error 'Cannot withdraw/deposit a non-positive amount.'
    end
    it('Throws an error if you enter a date which is not a date') do
      expect { @bank.withdraw(50, '31/02/2021') }.to raise_error 'That date is not recognised, please try again.'
    end
    it('Throws an error if you enter a amount which is not a integer') do
      expect { @bank.withdraw('six') }.to raise_error 'That amount is not recognised as a value, please try again.'
    end
  end

  describe '#add_to_history' do
    it('Pushes the latest withdraw or deposit into the history array') do
      deposit_date = Date.new(2021, 12, 31)
      @bank.deposit(100, deposit_date)

      expect(@bank.history).to eq([{ date: deposit_date, credit: 100, debit: 0, balance: 100 }])
    end
    it('Pushes a deposit and a withdraw into the history array') do
      deposit_date = Date.new(2021, 12, 31)
      @bank.deposit(100, deposit_date)
      @bank.withdraw(50, deposit_date)
      expect(@bank.history).to eq(
        [{ date: deposit_date, credit: 100, debit: 0, balance: 100 },
         { date: deposit_date, credit: 0, debit: 50, balance: 50 }]
      )
    end
  end

  describe '#print_summary' do
    it('Is a method within the Bank class') do
      expect(@bank).to respond_to :print_summary
    end
    it('prints the headers for the transaction summary') do
      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n").to_stdout
    end
    it('prints the transaction summary of a single deposit') do
      deposit_date = Date.new(2021, 12, 31)
      @bank.deposit(50, deposit_date)
      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n 31/12/2021 || 50.00 || || 50.00\n").to_stdout
    end
    it('prints the transaction summary of a single withdrawal') do
      withdraw_date = Date.new(2021, 12, 31)
      @bank.withdraw(50, withdraw_date)
      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n 31/12/2021 || || 50.00 || -50.00\n").to_stdout
    end
    it('prints the transaction summary of a two transactions') do
      deposit_date = Date.new(2021, 12, 30)
      @bank.deposit(100, deposit_date)

      withdraw_date = Date.new(2021, 12, 31)
      @bank.withdraw(50, withdraw_date)

      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n 31/12/2021 || || 50.00 || 50.00\n 30/12/2021 || 100.00 || || 100.00\n").to_stdout
    end
    it('prints the transaction summary of a multiple transactions in order of newest to oldest') do
      deposit_date = Date.new(2023, 1, 10)
      @bank.deposit(1000, deposit_date)

      deposit_date2 = Date.new(2023, 1, 13)
      @bank.deposit(2000, deposit_date2)

      withdraw_date = Date.new(2023, 1, 14)
      @bank.withdraw(500, withdraw_date)

      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n 14/01/2023 || || 500.00 || 2500.00\n 13/01/2023 || 2000.00 || || 3000.00\n 10/01/2023 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
