class GamesController < ApplicationController
  def create
    @game = Game.create(:current_player => 0) 
    @game.save
    params[:player_list].split(",").each do |p|
      puts p
      Player.create(:name => p, :points => 0, :game => @game)
    end
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @players = @game.players.order(:name)
    cur_index = @game.current_player 
    if cur_index >= @players.length - 1
      cur_index = 0
    else
      cur_index += 1
    end
    @game.current_player = cur_index
    @game.save
    @cur_player = @players[cur_index]
  end

  def correct
      @game = Game.find(params[:id])
      p = @game.players.order(:name)[@game.current_player]
      points = [0, 1, 3, 5]
      p.points += points[params[:rating].to_i]
      p.save
      redirect_to @game
  end

  def penalty
      @game = Game.find(params[:game_id])
      @players = @game.players.pluck(:name)
      @penalty = Penalty.where("rating = ?", params[:rating].to_i).sample
  end

  def reset
      @game = Game.find(params[:id])
      @game.dare.destroy_all
      @game.players.each do |p|
          p.points = 0
          puts p
          p.save
      end
      redirect_to @game
  end

  def question
      @game = Game.find(params[:id])
      prev_dares = @game.dare
      @players = @game.players.pluck(:name)
      a = Dare.where("rating = ?", params[:rating].to_i).all
      @dare = (a - prev_dares).sample
      if @dare.nil?
          ratings = ['mild', 'medium', 'super hot']
          @error = "Out of #{ratings[params[:rating].to_i - 1]} questions"
          @players = @game.players
          @cur_player = @game.players.order(:name)[@game.current_player]
          render :show
      else
          Question.create(:dare => @dare, :game => @game).save
      end
  end
end
