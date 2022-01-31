# frozen_string_literal: true

# Used for all of the methods required by this task.

class Bank
  attr_reader :balance, :debit, :credit, :date

  def initialize
    @balance = 0
    @debit = 0
    @credit = 0
    @date
  end

  def deposit(amount, date = Date.today())
    @balance += amount
    @credit = 0
    @debit = amount
    @date = date
  end

  def withdraw(amount, date = Date.today())
    @balance -= amount
    @debit = 0
    @credit = amount
    @date = date
  end
end
