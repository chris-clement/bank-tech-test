# frozen_string_literal: true

# Used for all of the methods required by this task.

require './lib/bank_account_display.rb'

class Bank
  attr_reader :balance, :debit, :credit, :date, :history

  def initialize
    @balance = 0
    @debit = 0
    @credit = 0
    @date
    @history = []
    @bank_account_display = BankAccountDisplay.new
  end

  def deposit(amount, date = Date.today())
    check_for_amount_and_date_errors(amount, date)
    @balance += amount
    @debit = 0
    @credit = amount
    @date = date
    add_to_history
  end

  def withdraw(amount, date = Date.today())
    check_for_amount_and_date_errors(amount, date)
    @balance -= amount
    @credit = 0
    @debit = amount
    @date = date
    add_to_history
  end

  def print_summary
    @bank_account_display.print_summary(@history)
  end

  private

  def add_to_history
    history << { date: @date, credit: @credit, debit: @debit, balance: @balance }
  end

  def date_valid?(date)
    date.instance_of?(Date)
  end

  def check_for_amount_and_date_errors(amount, date)
    if !amount.is_a? Integer
      raise 'That amount is not recognised as a value, please try again.'
    elsif !date_valid?(date)
      raise 'That date is not recognised, please try again.'
    elsif amount <= 0
      raise 'Cannot withdraw/deposit a non-positive amount.'
    end
  end
end
