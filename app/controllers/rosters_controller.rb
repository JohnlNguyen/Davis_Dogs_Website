class RostersController < ApplicationController
  http_basic_authenticate_with :name => "topdog", :password => "on3onme", :except => [:index, :show, :display]

  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = Roster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rosters }
    end
  end

  # GET /rosters/1
  # GET /rosters/1.json
  def show
    @roster = Roster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roster }
    end
  end

  # GET /rosters/new
  # GET /rosters/new.json
  def new
    @roster = Roster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roster }
    end
  end

  # GET /rosters/1/edit
  def edit
    @roster = Roster.find(params[:id])
  end

  # POST /rosters
  # POST /rosters.json
  def create
    @roster = Roster.new(params[:roster])

    respond_to do |format|
      if @roster.save
        format.html { redirect_to @roster, notice: 'Roster was successfully created.' }
        format.json { render json: @roster, status: :created, location: @roster }
      else
        format.html { render action: "new" }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rosters/1
  # PUT /rosters/1.json
  def update
    @roster = Roster.find(params[:id])

    respond_to do |format|
      if @roster.update_attributes(params[:roster])
        format.html { redirect_to @roster, notice: 'Roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rosters/1
  # DELETE /rosters/1.json
  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy

    respond_to do |format|
      format.html { redirect_to rosters_url }
      format.json { head :no_content }
    end
  end
  def display
    @roster = Roster.find(params[:id])
	@topnews = News.last
	respond_to do |format|
      format.html # display.html.erb
      format.json { render json: @roster }
    end
  end
end
