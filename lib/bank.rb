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
    @balance += amount
    @credit = 0
    @debit = amount
    @date = date
    add_to_history
  end

  def withdraw(amount, date = Date.today())
    @balance -= amount
    @debit = 0
    @credit = amount
    @date = date
    add_to_history
  end

  def print_summary
    puts 'date || credit || debit || balance'
    if @credit == 0
      puts " #{@date.strftime('%d/%m/%Y')} || || #{sprintf('%.2f', @debit)} || #{sprintf('%.2f', @balance)}" unless @date.nil?
    else
      puts " #{@date.strftime('%d/%m/%Y')} || #{sprintf('%.2f', @credit)} || || #{sprintf('%.2f', @balance)}" unless @date.nil?
    end
  end

  private

  def add_to_history
    history << { date: @date, credit: @credit, debit: @debit, balance: @balance }
  end
end
