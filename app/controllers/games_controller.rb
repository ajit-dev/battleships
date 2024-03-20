class GamesController < ApplicationController

  def index
  end

  def show
    @p1_grid, @p2_grid = Game.new(game_params, false).start
  end

  def new
  end

  private

  def game_params
    params.permit!
  end

end
