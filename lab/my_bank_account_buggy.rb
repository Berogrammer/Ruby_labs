class BankAccount
  attr_reader :balance, :owner

  def initialize(owner, initial_balance)
    @owner   = owner
    @balance = initial_balance
    @rate    = 0.05
  end

  def deposit(amount)
    if amount > 0
      # BUG 1: Deposit subtracts money from the balance → FIX: add the amount
      @balance += amount
      puts "  New balance: $#{"%.2f" % @balance}"
    else
      puts "  Error: Deposit amount must be positive."
    end
  end

  def withdraw(amount)
    # BUG 2: Withdrawal allows overdrawing the account → FIX: only withdraw if sufficient funds exist
    if amount > @balance
      puts "  Error: Insufficient funds."
    else
      @balance -= amount
      puts "  New balance: $#{"%.2f" % @balance}"
    end
  end
  # BUG 3: Missing `end` for the withdraw method → FIX: close the method before defining apply_interest

  def apply_interest
    # BUG 4: Interest calculation replaces balance with only the interest amount → FIX: add interest to the existing balance
    @balance = @balance * (1 + @rate)
    puts "  New balance: $#{"%.2f" % @balance}"
  end

  def display_info
    puts "Owner  : #{@owner}"
    # BUG 5: Invalid string interpolation syntax → FIX: use #{@balance}
    puts "Balance: $#{"%.2f" % @balance}"
  end
end

# --- Script entry point ---

account = BankAccount.new("Alice", 1000)

puts "=== Account Info ==="
account.display_info
puts

puts "Depositing $500..."
account.deposit(500)
puts

puts "Withdrawing $200..."
account.withdraw(200)
puts

puts "Applying 5% interest..."
account.apply_interest
puts

puts "Attempting to overdraw $2000..."
account.withdraw(2000)
puts

account.display_info