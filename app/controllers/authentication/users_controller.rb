class Authentication::UsersController < ApplicationController
skip_before_action :protect_pages
  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    if @users.save
      session[:user_id] = @users.id
      redirect_to restaurants_path, notice: "created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
