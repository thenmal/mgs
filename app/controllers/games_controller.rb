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
    @players = Player.where(:game => @game).order(:name)
    cur_index = @game.current_player 
    if cur_index >= @players.length
      cur_index = 0
    else
      cur_index += 1
    end
    @game.current_player = cur_index
    @cur_player = @players[cur_index]
    puts @cur_player
    puts @players
  end
end
