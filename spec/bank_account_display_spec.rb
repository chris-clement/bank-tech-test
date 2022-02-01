# frozen_string_literal: true

require 'bank_account_display'

describe BankAccountDisplay do

  before(:each) do
    @bank_account_display = BankAccountDisplay.new
  end
  describe '#print_summary' do
    it('Is a method within the BankAccountDisplay class') do
      expect(@bank_account_display).to respond_to :print_summary
    end
    it('prints the headers for the transaction summary') do
      history = []
      expect do
        @bank_account_display.print_summary(history)
      end.to output("date || credit || debit || balance\n").to_stdout
    end
    it('prints the transaction summary of a single deposit') do
      deposit_date = Date.new(2021, 12, 31)
      history = [{ date: deposit_date, credit: 100, debit: 0, balance: 100 }]
      expect do
        @bank_account_display.print_summary(history)
      end.to output("date || credit || debit || balance\n 31/12/2021 || 100.00 || || 100.00\n").to_stdout
    end
    it('prints the transaction summary of a single withdrawal') do
      withdraw_date = Date.new(2021, 12, 31)
      history = [{ date: withdraw_date, credit: 0, debit: 50, balance: -50 }]
      expect do
        @bank_account_display.print_summary(history)
      end.to output("date || credit || debit || balance\n 31/12/2021 || || 50.00 || -50.00\n").to_stdout
    end
    it('prints the transaction summary of a two transactions') do
      deposit_date = Date.new(2021, 12, 30)
      # @bank.deposit(100, deposit_date)
      withdraw_date = Date.new(2021, 12, 31)
      # @bank.withdraw(50, withdraw_date)
      history = [{ date: deposit_date, credit: 100, debit: 0, balance: 100 }, 
                 { date: withdraw_date, credit: 0, debit: 50, balance: 50}
                ]
      expect do
        @bank_account_display.print_summary(history)
      end.to output("date || credit || debit || balance\n 31/12/2021 || || 50.00 || 50.00\n 30/12/2021 || 100.00 || || 100.00\n").to_stdout
    end
    # it('prints the transaction summary of a multiple transactions in order of newest to oldest') do
    #   deposit_date = Date.new(2023, 1, 10)
    #   @bank.deposit(1000, deposit_date)

    #   deposit_date2 = Date.new(2023, 1, 13)
    #   @bank.deposit(2000, deposit_date2)

    #   withdraw_date = Date.new(2023, 1, 14)
    #   @bank.withdraw(500, withdraw_date)

    #   expect do
    #     @bank_account_display.print_summary
    #   end.to output("date || credit || debit || balance\n 14/01/2023 || || 500.00 || 2500.00\n 13/01/2023 || 2000.00 || || 3000.00\n 10/01/2023 || 1000.00 || || 1000.00\n").to_stdout
    # end
  end
end