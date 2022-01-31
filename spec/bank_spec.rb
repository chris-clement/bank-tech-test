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
    it('Updates the debit variable to equal the amount desposited') do
      @bank.deposit(50)
      expect(@bank.debit).to equal 50
    end
    it('Updates the debit variable to only the latest amount desposited') do
      @bank.deposit(50)
      @bank.deposit(20)
      expect(@bank.debit).to equal 20
    end
    it('The credit variable is set to 0 after a deposit is made') do
      @bank.withdraw(30)
      @bank.deposit(10)
      expect(@bank.credit).to equal 0
    end
    it('Deposits have an associated date, this defaults to today if one is not provided') do
      @bank.deposit(100)
      expect(@bank.date.day).to equal Date.today.day
      expect(@bank.date.month).to equal Date.today.month
      expect(@bank.date.year).to equal Date.today.year
    end
    it('Deposits have an associated date') do
      @bank.deposit(100, Date.new(2021, 07, 06))
      expect(@bank.date.day).to equal 6
      expect(@bank.date.month).to equal 7
      expect(@bank.date.year).to equal 2021
    end
  end

  describe('#withdraw') do
    it('Is a method within the Bank class') do
      expect(@bank).to respond_to :withdraw
    end
    it('Reduces the balance by the amount withdrawn') do
      expect { @bank.withdraw(50) }.to change { @bank.balance }.by(-50)
    end
    it('Updates the credit variable to equal the amount withdrawn') do
      @bank.withdraw(50)
      expect(@bank.credit).to equal 50
    end
    it('Updates the credit variable to only the latest amount withdrawn') do
      @bank.withdraw(50)
      @bank.withdraw(20)
      expect(@bank.credit).to equal 20
    end
    it('The debit variable is set to 0 after a withdrawal is made') do
      @bank.deposit(10)
      @bank.withdraw(30)
      expect(@bank.debit).to equal 0
    end
  end
end
