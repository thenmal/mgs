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

  def question
      @game = Game.find(params[:id])
      prev_dares = @game.dare
      @dare = Dare.where("rating = ? and id not in (?)", params[:rating].to_i, prev_dares).sample
      Question.create(:dare => @dare, :game => @game).save
  end
end
