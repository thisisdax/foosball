class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @game = Game.where(match_id: params[:id]).first
    @match = Match.where(id: params[:id]).first
    getscore
  end

  # GET /matches/new
  def new
    @match = Match.new
    @team = Team.all.map{ |team| [team.team_name, team.id] }
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getscore
    if Game.where(match_id: @match.id).length == 0
      teamone = rand(11)
      teamtwo = rand(11)
      if teamone > teamtwo
        @game = Game.create(match_id: @match.id, result: @match.team_id, team_score: teamone, away_score: teamtwo)
      elsif teamtwo > teamone
        @game = Game.create(match_id: @match.id, result: @match.away_id, team_score: teamone, away_score: teamtwo)
      else
        @game = Game.create(match_id: @match.id, result: 0, team_score: teamone, away_score: teamtwo)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:team_id, :away_id)
    end
end
