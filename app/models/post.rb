class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title
  validates :title, presence: true,
					length: { minimum: 5}
  validates :content, presence: true,
					  length: {minimum: 20}
  validates :author, presence: true,
					  length: {minimum: 5}
  
  has_many :comments, :dependent => :destroy
end
