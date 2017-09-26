class BankAccount
  # @@interest_rate.to_f = 4.5 #float rate
  @@accounts = [] #store list of all bank accounts in bank

  def initialize
    @balance = 0
  end

  def deposit(number)
    @balance += number
    return @balance
  end

  def withdraw(number)
    @balance -= number
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
  # def total_funds
  #   sum = 0
  #   @@accounts.each do |each_account|
  #     sum += each_account.balance  #**************************
  #   end
  #   return sum
  # end

  #CLASS METHOD
  #go through each account and increase balance based on interest_rate
  # def interest_time
  #   @@accounts.each do |account|
  #     @balance += (@balance * @@interest_rate)
  #   end
  # end
def self.accounts
  return @@accounts
end

end

#EG. OUTPUT
my_account = BankAccount.create
your_account = BankAccount.create
puts BankAccount.accounts


# puts my_account.balance # 0
# puts BankAccount.total_funds # 0
# my_account.deposit(200)
# your_account.deposit(1000)
# puts my_account.balance # 200
# puts your_account.balance # 1000
# puts BankAccount.total_funds # 1200
# # BankAccount.interest_time
# puts my_account.balance # 202.0
# puts your_account.balance # 1010.0
# puts BankAccount.total_funds # 1212.0
# my_account.withdraw(50)
# puts my_account.balance # 152.0
# puts BankAccount.total_funds # 1162.0
