class BankAccountDisplay

  COLUMN_SPACING = 12

  def print_summary(history)
    sort_transaction_history(history)

    puts "date".center(COLUMN_SPACING) + "||" + 
    "credit".center(COLUMN_SPACING) + "||" + 
    "debit".center(COLUMN_SPACING) + "||" + 
    "balance".center(COLUMN_SPACING)

    history.each do |transaction|
      if debit_transaction?(transaction)
        puts "#{transaction[:date].strftime('%d/%m/%Y')}".center(COLUMN_SPACING) + "||" + 
        "".center(COLUMN_SPACING) + "||" + 
        "#{sprintf('%.2f', transaction[:debit])}".center(COLUMN_SPACING) + "||" + 
        "#{sprintf('%.2f', transaction[:balance])}".center(COLUMN_SPACING)
      else
        puts "#{transaction[:date].strftime('%d/%m/%Y')}".center(COLUMN_SPACING) + "||" + 
        "#{sprintf('%.2f', transaction[:credit])}".center(COLUMN_SPACING) + "||" + 
        "".center(COLUMN_SPACING) + "||" + 
        "#{sprintf('%.2f', transaction[:balance])}".center(COLUMN_SPACING)
      end
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
