# frozen_string_literal: true

require 'bank'
require 'bank_account_display'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end
  context "Client makes 2 deposits and a withdrawal then wants to see their account summary" do
    it("should return the correct summary exactly as the acceptance criteria") do
      @bank.deposit(1000, Date.new(2023, 1, 10))
      @bank.deposit(2000, Date.new(2023, 1, 13))
      @bank.withdraw(500, Date.new(2023, 1, 14))
      expect do
        @bank.print_summary
      end.to output("date || credit || debit || balance\n" + 
                    "14/01/2023 || || 500.00 || 2500.00\n" + 
                    "13/01/2023 || 2000.00 || || 3000.00\n" + 
                    "10/01/2023 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end