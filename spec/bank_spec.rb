require 'bank'

describe Bank do 
  before(:each) do
    @bank = Bank.new()
  end
  it("starts with a balance of 0") do
    expect(@bank.balance).to equal 0
  end

  describe('#deposit') do
    it("Is a method within the Bank class") do
      expect(@bank).to respond_to :deposit
    end
    it("Changes the balance by the amount deposited") do
      @bank.deposit(50)
      expect{ @bank.deposit(50) }.to change { @bank.balance }.by 50
    end
  end
end