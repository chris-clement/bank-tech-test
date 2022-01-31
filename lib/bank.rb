# frozen_string_literal: true

# Used for all of the methods required by this task.

class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end
