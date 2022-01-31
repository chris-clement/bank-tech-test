# frozen_string_literal: true

# Used for all of the methods required by this task.

class Bank
  attr_reader :balance, :debit, :credit

  def initialize
    @balance = 0
    @debit = 0
    @credit = 0
  end

  def deposit(amount)
    @balance += amount
    @credit = 0
    @debit = amount
  end

  def withdraw(amount)
    @balance -= amount
    @debit = 0
    @credit = amount
  end
end
