class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password, :username)
    @user = User.new(user_params)
    if @user.valid?

    else render 'new'

  end
end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])

  end
end
