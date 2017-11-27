class GamesController < ApplicationController
include SessionsHelper
  def index
    @games = Game.all
    if logged_in?
      @friend_ids = current_user.requests.pluck(:id)
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      redirect_to root_path
    else
      render :show
    end
  end

end
