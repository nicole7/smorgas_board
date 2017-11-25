class GamesController < ApplicationController
include SessionsHelper
  def index
    @games = Game.all
    @friend_ids = current_user.requests.pluck(:id)
    p "******"
    p @friend_ids
    p "******"
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      redirect_to game_path
    else
      render :show
    end
  end

end
