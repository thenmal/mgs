class Penalty < ActiveRecord::Base
  attr_accessible :name, :rating, :text

  validates :name, :presence => true
  validates :text, :presence => true
  validates :rating, :presence => true, :inclusion => { :in => 1..3, :message => 'Please specify a value 1 - 3'}
end
