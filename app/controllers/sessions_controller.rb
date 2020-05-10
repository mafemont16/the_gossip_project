class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.new(user_params)
    if @user.valid?

    else render 'new'

  end
end

end
