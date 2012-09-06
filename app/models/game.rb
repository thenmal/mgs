class Game < ActiveRecord::Base
  attr_accessible :current_player
  has_many :players 
  has_many :questions
  has_many :dare, :through => :questions
end
