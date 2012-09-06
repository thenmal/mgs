class Question < ActiveRecord::Base
  belongs_to :dare
  belongs_to :game
  attr_accessible :dare, :game 
end
