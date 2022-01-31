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
    if !date_valid?(date)
      raise 'That date is not recognised, please try again.'
    elsif amount <= 0
      raise 'Cannot deposit a non-positive amount, did you mean to withdraw?'
    else
      @balance += amount
      @debit = 0
      @credit = amount
      @date = date
      add_to_history
    end
  end

  def withdraw(amount, date = Date.today())
    if !date_valid?(date)
      raise 'That date is not recognised, please try again.'
    elsif amount <= 0
      raise'Cannot withdraw a non-positive amount, did you mean to deposit'
    else
      @balance -= amount
      @credit = 0
      @debit = amount
      @date = date
      add_to_history
    end
  end

  def print_summary
    @history.sort_by! {|transaction| transaction[:date]}.reverse!
    puts 'date || credit || debit || balance'
    for i in 0..(@history.length - 1)
      if @history[i][:credit] == 0
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
end
