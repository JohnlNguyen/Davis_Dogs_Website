class HomeController < ApplicationController
  layout "front", only: [:index, :contact, :newcomers, :parents, :merchandise, :history]
  def index
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
  def contact
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
  def newcomers
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
  def parents
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
  def merchandise
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
  def history
	@topnews = News.last
	@roster = Roster.all
	@post = Post.all
  end
end
