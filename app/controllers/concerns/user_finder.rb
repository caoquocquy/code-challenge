require 'rest-client'

class UserFinder

  USERS_ENDPOINT = 'https://sample-accounts-api.herokuapp.com/users'
  private_constant :USERS_ENDPOINT

  def initialize(user_id)
    @user_id = user_id
  end

  def execute
    begin
      user_response = RestClient.get user_url
      user_data = JSON.parse user_response.body
      accounts_response = RestClient.get accounts_url
      accounts_data = JSON.parse accounts_response.body
      Success.new User.new(user_data, accounts_data)
    rescue => error
      Failure.new(error)
    end
  end

  private

  attr_reader :user_id

  def user_url
    USERS_ENDPOINT + "/#{user_id}"
  end

  def accounts_url
    USERS_ENDPOINT + "/#{user_id}/accounts"
  end

  class Success
    def initialize(user)
      @user = user
    end

    def success?
      true
    end

    attr_reader :user
  end

  class Failure
    def initialize(error)
      @error = error
    end

    def success?
      false
    end

    attr_reader :error
  end
end
