class UsersController < ApplicationController
  def index
    # @users = User.search(params[:search])
    # @friends = User.friendship(current_user)
  end

  def show
    @user = current_user
  end

  def search()
    @users = User.search(params[:search])
  end
end
