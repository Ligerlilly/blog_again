class UsersController < ApplicationController

  private
  def find_user
    @user = User.find(params[:id])

  end
end
