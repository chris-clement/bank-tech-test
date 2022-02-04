# frozen_string_literal: true

# Used for all of the methods required by this task.

require './lib/bank_account_display.rb'

class Bank
  attr_reader :debit, :credit, :history, :bank_account_display

  def initialize(bank_account_display = BankAccountDisplay.new)
    @debit = 0
    @credit = 0
    @history = []
    @bank_account_display = bank_account_display
  end

  def deposit(amount, date = Date.today())
    check_for_amount_and_date_errors(amount, date)
    @debit = 0
    @credit = amount
    add_to_history(date)
  end

  def withdraw(amount, date = Date.today())
    check_for_amount_and_date_errors(amount, date)
    @credit = 0
    @debit = amount
    add_to_history(date)
  end

  def print_summary
    @bank_account_display.print_summary(@history)
  end

  private

  def add_to_history(transaction_date)
    history << { date: transaction_date, credit: @credit, debit: @debit }
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
