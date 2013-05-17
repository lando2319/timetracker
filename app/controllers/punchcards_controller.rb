class PunchcardsController < ApplicationController
  # GET /punchcards
  # GET /punchcards.json
  def index
    @punchcards = Punchcard.where(:timeout => nil)

    @completedcards = Punchcard.where("timeout IS NOT NULL").order('timeout desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punchcards }
    end
  end

  # GET /punchcards/1
  # GET /punchcards/1.json
  def show
    @punchcard = Punchcard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punchcard }
    end
  end

  # GET /punchcards/new
  # GET /punchcards/new.json
  def new
    @punchcard = Punchcard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punchcard }
    end
  end

  # GET /punchcards/1/edit
  def edit
    @punchcard = Punchcard.find(params[:id])
  end

  # POST /punchcards
  # POST /punchcards.json
  def create
    @punchcard = Punchcard.new(params[:punchcard])

    respond_to do |format|
      if @punchcard.save
        format.html { redirect_to @punchcard, notice: 'Punchcard was successfully created.' }
        format.json { render json: @punchcard, status: :created, location: @punchcard }
      else
        format.html { render action: "new" }
        format.json { render json: @punchcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /punchcards/1
  # PUT /punchcards/1.json
  def update
    @punchcard = Punchcard.find(params[:id])

    respond_to do |format|
      if @punchcard.update_attributes(params[:punchcard])
        format.html { redirect_to @punchcard, notice: 'Punchcard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @punchcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punchcards/1
  # DELETE /punchcards/1.json
  def destroy
    @punchcard = Punchcard.find(params[:id])
    @punchcard.destroy

    respond_to do |format|
      format.html { redirect_to punchcards_url }
      format.json { head :no_content }
    end
  end

  def timein
    @punchcard = Punchcard.find(params[:id])
    @punchcard.timein = DateTime.now
    @punchcard.save
    redirect_to '/punchcards', notice: 'You have clocked in'
  end


  def timeout
    @punchcard = Punchcard.find(params[:id])
    @punchcard.timeout = DateTime.now
    @punchcard.save
    redirect_to '/punchcards', notice: 'You have clocked out'
  end

end
