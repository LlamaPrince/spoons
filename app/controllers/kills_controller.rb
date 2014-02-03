class KillsController < ApplicationController
  before_action :set_kill, only: [:show, :edit, :update, :destroy,:grant]

  # GET /kills
  # GET /kills.json
  def index
    @kills = Kill.all
  end

  # GET /kills/1
  # GET /kills/1.json
  def show
  end

  # GET /kills/new
  def new
    @kill = Kill.new
  end
	
  def grant
	Kill.transaction do
	# do your stuff
	next_target = @kill.target.target
	@kill.target.update_attribute(:status, "Dead")
	@kill.killer.update_attribute(:target, next_target)
	@kill.update_attribute(:granted, true)	
	redirect_to :kills, notice: "The kill was granted."	
	end
  end 

  

  # GET /kills/1/edit
  def edit
  end

  # POST /kills
  # POST /kills.json
  def create
    @kill = Kill.new(kill_params)

    respond_to do |format|
      if @kill.save
        format.html { redirect_to @kill, notice: 'Kill was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kill }
      else
        format.html { render action: 'new' }
        format.json { render json: @kill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kills/1
  # PATCH/PUT /kills/1.json
  def update
    respond_to do |format|
      if @kill.update(kill_params)
        format.html { redirect_to @kill, notice: 'Kill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kills/1
  # DELETE /kills/1.json
  def destroy
    @kill.destroy
    respond_to do |format|
      format.html { redirect_to kills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kill
      @kill = Kill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kill_params
      params.require(:kill).permit(:target_id, :killer_id, :granted, :date)
    end
end
