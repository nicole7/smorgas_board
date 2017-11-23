class UsersController < ApplicationController

  def new
    @user = User.new

    respond_to do |f|
      f.js
      f.html
    end

  end

  def create
    @user = User.new(user_params)

    respond_to do |f|
      f.js
      f.html
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
