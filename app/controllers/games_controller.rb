class GamesController < ApplicationController

  def show
    if params[:id]
      @bird = Bird.find_by(id: params[:id])
    else
      @bird = Bird.order('RANDOM()').first
      # binding.pry
    end
    @other_birds = Bird.where.not(id: @bird_id).order('RANDOM()').limit(3)
    @options = (@other_birds + [@bird]).shuffle
  end

end