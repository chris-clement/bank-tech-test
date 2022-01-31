# frozen_string_literal: true

# Used for all of the methods required by this task.

class Bank
  attr_reader :balance, :debit, :credit, :date, :history

  def initialize
    @balance = 0
    @debit = 0
    @credit = 0
    @date
    @history = []
  end

  def deposit(amount, date = Date.today())
    check_for_amount_and_date_errors(amount,date)
    @balance += amount
    @debit = 0
    @credit = amount
    @date = date
    add_to_history
  end

  def withdraw(amount, date = Date.today())
    check_for_amount_and_date_errors(amount,date)
    @balance -= amount
    @credit = 0
    @debit = amount
    @date = date
    add_to_history
  end

  def print_summary
    sort_transaction_history
    puts 'date || credit || debit || balance'
    for i in 0..(@history.length - 1)
      if debit_transaction?(i)
        puts " #{@history[i][:date].strftime('%d/%m/%Y')} || || #{sprintf('%.2f', @history[i][:debit])} || #{sprintf('%.2f', @history[i][:balance])}"
      else
        puts " #{@history[i][:date].strftime('%d/%m/%Y')} || #{sprintf('%.2f', @history[i][:credit])} || || #{sprintf('%.2f', @history[i][:balance])}"
      end
    end
  end

  private

  def add_to_history
    history << { date: @date, credit: @credit, debit: @debit, balance: @balance }
  end

  def date_valid?(date)
    date.instance_of?(Date)
  end

  def sort_transaction_history
    @history.sort_by! { |transaction| transaction[:date] }.reverse!
  end

  def debit_transaction?(history_index)
    @history[history_index][:credit] == 0
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
