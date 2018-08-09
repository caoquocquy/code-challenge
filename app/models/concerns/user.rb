class User
  def initialize(user_data, accounts_data)
    @name = user_data['attributes']['name']
    @accounts = accounts_data.map do |account_data|
      Account.new(account_data)
    end
  end

  attr_reader :name, :accounts
end
