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
  end
end