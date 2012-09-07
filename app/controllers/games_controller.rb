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
      @penalty = Penalty.where("rating = ?", params[:rating].to_i).sample
  end

  def reset
      @game = Game.find(params[:id])
      @game.dare.destroy_all
      redirect_to @game
  end

  def question
      @game = Game.find(params[:id])
      prev_dares = @game.dare
      a = Dare.where("rating = ?", params[:rating].to_i).all
      @dare = (a - prev_dares).sample
      if @dare.nil?
          raise 'Out of Questions'
      else
          Question.create(:dare => @dare, :game => @game).save
      end
  end
end
