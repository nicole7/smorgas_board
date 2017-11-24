class RequestsController < ApplicationController

  before_action :set_friend_request, except: %i[index create]

  def index
    @received = Request.where(friend: current_user)
    @sent = current_user.requests
  end

  def create
    friend = User.find(params[:friend_id])
    @request = current_user.requests.build(friend: friend)

    if @request.save
      flash[:success] = 'Friend request sent.'
    else
      flash[:danger] = 'Friend request could not be sent.'
    end
    redirect_to root_path
  end

  def update
    @request.accept_friend
    flash[:success] = 'Friend request accepted.'
    redirect_to user_friend_requests_path(current_user)
  end

  def destroy
    @friend_request.destroy
    flash[:info] = 'Friend request declined.'
    redirect_to root_path
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end