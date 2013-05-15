class PlayersController < ApplicationController

  http_basic_authenticate_with :name => "topdog", :password => "on3onme", :except => [:display]
  # # GET /players
  # # GET /players.json
  # def index
    # @players = Player.all

    # respond_to do |format|
      # format.html # index.html.erb
      # format.json { render json: @players }
    # end
  # end

  # # GET /players/1
  # # GET /players/1.json
  # def show
    # @player = Player.find(params[:id])

    # respond_to do |format|
      # format.html # show.html.erb
      # format.json { render json: @player }
    # end
  # end

  # # GET /players/new
  # # GET /players/new.json
  # def new
    # @player = Player.new

    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @player }
    # end
  # end

  # GET /players/1/edit
  def edit
	@roster = Roster.find(params[:roster_id])
    @player = Player.find(params[:id])
  end

  # # POST /players
  # # POST /players.json
  # def create
    # @player = Player.new(params[:player])

    # respond_to do |format|
      # if @player.save
        # format.html { redirect_to @player, notice: 'Player was successfully created.' }
        # format.json { render json: @player, status: :created, location: @player }
      # else
        # format.html { render action: "new" }
        # format.json { render json: @player.errors, status: :unprocessable_entity }
      # end
    # end
  # end

  # # PUT /players/1
  # # PUT /players/1.json
  def update
    @player = Player.find(params[:id])
	@roster = Roster.find(params[:roster_id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @roster, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /players/1
  # # DELETE /players/1.json
  # def destroy
    # @player = Player.find(params[:id])
    # @player.destroy

    # respond_to do |format|
      # format.html { redirect_to rosters_url }
      # format.json { head :no_content }
    # end
  # end
  def create
    @roster = Roster.find(params[:roster_id])
    @player = @roster.players.create(params[:player])
    redirect_to roster_path(@roster)
  end
  def destroy
    @roster = Roster.find(params[:roster_id])
    @player = @roster.players.find(params[:id])
    @player.destroy
    redirect_to roster_path(@roster)
  end
  def display
	@post = Post.all
    @roster = Roster.find(params[:roster_id])
    @player = @roster.players.find(params[:id])
	@topnews = News.last
    respond_to do |format|
      format.html {render layout: 'front'}# display.html.erb
      format.json { render json: @player }
    end
  end
end
