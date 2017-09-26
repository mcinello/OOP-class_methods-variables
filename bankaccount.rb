class BankAccount
  # @@interest_rate.to_f = 4.5 #float rate
  @@accounts = [] #store list of all bank accounts in bank
  @@total_funds = 0.0
  @@interest_rate = (2.5 / 100)

  def initialize
    @balance = 0.00
  end

  def deposit(amount)
    @balance += amount.to_f
    return @balance
  end

  def withdraw(amount)
    @balance -= amount.to_f
    return @balance
  end

  def balance
    return @balance
  end


#CLASS METHOD
#call class BankAccount to add new account to the accounts array
  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
  return new_account
  end

#CLASS METHOD
#add all balances from every account
  def self.total_funds
    sum = 0
    @@accounts.each do |each_account|
    @@total_funds = (sum += each_account.balance)
    end
    return @@total_funds
  end

  #CLASS METHOD
  #go through each account and increase balance based on interest_rate
  def self.interest_time
    @@accounts.each do |account|
      account.deposit(account.balance * @@interest_rate)
    end
  end

  def self.accounts
    return @@accounts
  end

end

#EG. OUTPUT
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 205.0
puts your_account.balance # 1025.0
puts BankAccount.total_funds # 1230.0
my_account.withdraw(50)
puts my_account.balance # 155.0
puts BankAccount.total_funds # 1180.0
