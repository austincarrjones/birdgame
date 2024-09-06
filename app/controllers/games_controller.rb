class GamesController < ApplicationController
  def show
    if params[:id]
      @bird = Bird.find_by(id: params[:id])
      # binding.pry
    else
      @bird = Bird.order('RANDOM()').first
      # binding.pry
    end
    @other_birds = Bird.where.not(id: @bird_id).order('RANDOM()').limit(3)
    @options = (@other_birds + [@bird]).shuffle
  end

  def update
    @bird = Bird.find_by(id: params[:id])
    # binding.pry
    if params[:guess] == @bird.name
      flash[:notice] = "Correct! It's a #{@bird.name}."
    else
      flash[:alert] = "Wrong! It was #{@bird.name}"
    end
    redirect_to game_path
  end
end