class UsersController < ApplicationController
  before_action :find_user, except: [:new, :index, :create]

  def index
    @users = User.all
  end

  def show
    @comment = Comment.new  
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
