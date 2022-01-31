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
    it('Changes the balance by the amount deposited') do
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
  end

  describe('#withdraw') do
    it('Is a method within the Bank class') do
      expect(@bank).to respond_to :withdraw
    end
  end
end
