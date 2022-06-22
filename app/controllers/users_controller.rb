class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
    @sample_username = "user_#{Time.now.strftime('%M%S')}"
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path, notice: 'User has been successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'User has been successfully updated'
    else
      redirect_to edit_user_path(@user), alert: 'User has not been updated', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
