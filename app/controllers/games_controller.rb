class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game.find(params[:id])
  end

end
