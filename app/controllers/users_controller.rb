class UsersController < ApplicationController

  def index
    if params[:user_id].present?
      result = UserFinder.new(params[:user_id]).execute
      if result.success?
        @user = result.user
      else
        @error = result.error
      end
    end
  end
end
