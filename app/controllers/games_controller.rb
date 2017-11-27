class GamesController < ApplicationController
include SessionsHelper
  def index
    @games = Game.all
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
