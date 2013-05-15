class Roster < ActiveRecord::Base
  attr_accessible :name
  has_many :players, :dependent => :destroy
  
end
