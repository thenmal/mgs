class Dare < ActiveRecord::Base
  attr_accessible :imageurl, :rating, :text, :title

  validates :title, :presence => true
  validates :text, :presence => true
  validates :rating, :presence => true, :inclusion => { :in => 1..3, :message => 'Please specify a value 1 - 3'}
end
