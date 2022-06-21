class UsersController < ApplicationController
  def new
  end

  def create
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
