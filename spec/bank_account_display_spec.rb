# frozen_string_literal: true

require 'bank_account_display'

describe BankAccountDisplay do

  before(:each) do
    @bank_account_display = BankAccountDisplay.new
    @column_spacing = BankAccountDisplay::COLUMN_SPACING
  end
  describe '#print_summary' do
    it('Is a method within the BankAccountDisplay class') do
      expect(@bank_account_display).to respond_to :print_summary
    end
    it('prints the headers for the transaction summary') do
      history = []
      expect do
        @bank_account_display.print_summary(history)
      end.to output(
                     "date".center(@column_spacing) + "||" + "credit".center(@column_spacing) + "||" + "debit".center(@column_spacing) + "||" + "balance".center(@column_spacing) +"\n"
                   ).to_stdout
    end
    it('prints the transaction summary of a single deposit') do
      deposit_date = Date.new(2021, 12, 31)
      history = [{ date: deposit_date, credit: 100, debit: 0, balance: 100 }]
      expect do
        @bank_account_display.print_summary(history)
      end.to output(
                    "date".center(@column_spacing) + "||" + "credit".center(@column_spacing) + "||" + "debit".center(@column_spacing) + "||" + "balance".center(@column_spacing) +"\n" + 
                    "31/12/2021".center(@column_spacing) + "||" + "100.00".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" + "100.00".center(@column_spacing) + "\n"
                   ).to_stdout
    end
    it('prints the transaction summary of a single withdrawal') do
      withdraw_date = Date.new(2021, 12, 31)
      history = [{ date: withdraw_date, credit: 0, debit: 50, balance: -50 }]
      expect do
        @bank_account_display.print_summary(history)
      end.to output(
                    "date".center(@column_spacing) + "||" + "credit".center(@column_spacing) + "||" + "debit".center(@column_spacing) + "||" + "balance".center(@column_spacing) +"\n" + 
                    "31/12/2021".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" + "50.00".center(@column_spacing) + "||" +  "-50.00".center(@column_spacing) + "\n"
                    ).to_stdout
    end
    it('prints the transaction summary of a two transactions') do
      deposit_date = Date.new(2021, 12, 30)
      withdraw_date = Date.new(2021, 12, 31)
      history = [
                  { date: deposit_date, credit: 100, debit: 0, balance: 100 },
                  { date: withdraw_date, credit: 0, debit: 50, balance: 50 }
                ]
      expect do
        @bank_account_display.print_summary(history)
      end.to output(
                    "date".center(@column_spacing) + "||" + "credit".center(@column_spacing) + "||" + "debit".center(@column_spacing) + "||" + "balance".center(@column_spacing) +"\n" + 
                    "31/12/2021".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" +  "50.00".center(@column_spacing) + "||" +  "50.00".center(@column_spacing) + "\n" + 
                    "30/12/2021".center(@column_spacing) + "||" + "100.00".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" + "100.00".center(@column_spacing) + "\n"
                    ).to_stdout
    end
    it('prints the transaction summary of a multiple transactions in order of newest to oldest') do
      deposit_date = Date.new(2023, 1, 10)

      deposit_date2 = Date.new(2023, 1, 13)

      withdraw_date = Date.new(2023, 1, 14)

      history = [
                  { date: deposit_date, credit: 1000, debit: 0, balance: 1000 },
                  { date: deposit_date2, credit: 2000, debit: 0, balance: 3000 },
                  { date: withdraw_date, credit: 0, debit: 500, balance: 2500 }
                ]
      expect do
        @bank_account_display.print_summary(history)
      end.to output(
                    "date".center(@column_spacing) + "||" + "credit".center(@column_spacing) + "||" + "debit".center(@column_spacing) + "||" + "balance".center(@column_spacing) +"\n" + 
                    "14/01/2023".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" +  "500.00".center(@column_spacing) + "||" + "2500.00".center(@column_spacing) + "\n" + 
                    "13/01/2023".center(@column_spacing) + "||" + "2000.00".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" + "3000.00".center(@column_spacing) + "\n" + 
                    "10/01/2023".center(@column_spacing) + "||" +  "1000.00".center(@column_spacing) + "||" + "".center(@column_spacing) + "||" +  "1000.00".center(@column_spacing) + "\n"
                    ).to_stdout
    end
  end
end
