class Question < ActiveRecord::Base
  belongs_to :player
  belongs_to :dare
  # attr_accessible :title, :body
end
