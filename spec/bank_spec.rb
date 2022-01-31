require 'bank'

describe Bank do 
  it("starts with a balance of 0") do
    bank = Bank.new()
    expect(bank.balance).to equal 0
  end

  describe('#deposit') do
    it("Is a method within the Bank class") do
      bank = Bank.new()
      expect(bank).to respond_to :deposit
    end
    it("Changes the balance by the amount deposited") do
      bank = Bank.new()
      bank.deposit(50)
      expect{ bank.deposit(50) }.to change { bank.balance }.by 50
    end
  end
end