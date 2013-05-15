class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
	@topnews = News.last
	@roster = Roster.all
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
	@topnews = News.last
	@roster = Roster.all
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
	@topnews = News.last
	@roster = Roster.all
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
	@topnews = News.last
	@roster = Roster.all
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
	@topnews = News.last
	@roster = Roster.all
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
	@topnews = News.last
	@roster = Roster.all
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
	@topnews = News.last
	@roster = Roster.all
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def display
	@topnews = News.last
	@roster = Roster.all
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  def display_all
	@topnews = News.last
	@roster = Roster.all
    @post = Post.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
