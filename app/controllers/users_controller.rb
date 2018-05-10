class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def search
    @users = User.search(params[:search])
  end
end
