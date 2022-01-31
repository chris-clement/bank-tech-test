require 'bank'

describe Bank do 
  it("starts with a balance of 0") do
    bank = Bank.new()
    expect(bank.balance).to equal 0
  end
end