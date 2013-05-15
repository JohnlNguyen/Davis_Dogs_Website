class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title
  
  has_many :comments, :dependent => :destroy
end
