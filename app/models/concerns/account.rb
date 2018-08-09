class Account
  def initialize(account_data)
    attributes = account_data['attributes']
    @name = attributes['name']
    @balance = attributes['balance']
  end

  attr_reader :name, :balance
end
