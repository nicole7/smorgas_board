class UsersController < ApplicationController

  def new
    @user = User.new

    respond_to do |f|
      f.js
      f.html
    end

  end

  def create
    respond_to do |f|
      f.js
      f.html
    end
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Registration successful!"
      if request.xhr?
        render :create
      else
        redirect_to root_path
      end
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
