class Player < ActiveRecord::Base
  belongs_to :game
  attr_accessible :name, :points, :game
end
