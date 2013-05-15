class Player < ActiveRecord::Base
  belongs_to :roster
  attr_accessible :bio, :grade, :name, :number
end
