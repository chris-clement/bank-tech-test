class BankAccountDisplay

  def print_summary(history)
    puts "date || credit || debit || balance"
    add_balance(history)
    sort_transaction_history(history).each do |transaction|
      if debit_transaction?(transaction)
        puts "#{transaction[:date].strftime('%d/%m/%Y')} || || #{sprintf('%.2f', transaction[:debit])} || #{sprintf('%.2f', transaction[:balance])}"
      else
        puts "#{transaction[:date].strftime('%d/%m/%Y')} || #{sprintf('%.2f', transaction[:credit])} || || #{sprintf('%.2f', transaction[:balance])}"
      end
    end
  end

  def add_balance(history)
    balance_amount = 0
    # This ensures it starts with the oldest transaction
    history.sort_by! { |transaction| transaction[:date] }.each do |transaction|
      balance_amount += transaction[:credit] - transaction[:debit] 
      transaction.merge!(balance: balance_amount)
    end
  end

  private

  def debit_transaction?(transaction)
    transaction[:credit] == 0
  end

  def sort_transaction_history(history)
    history.sort_by! { |transaction| transaction[:date] }.reverse!
  end

end
