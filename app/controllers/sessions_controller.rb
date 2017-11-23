class SessionsController < ApplicationController

  def new
    @user = User.new

    respond_to do |f|
      f.js
      f.html
    end

  end

  def create
    @user = User.find_by(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = ["Something went wrong."]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
