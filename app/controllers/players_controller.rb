class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def login
    @player = Player.find_by(email: login_params[:email])

    if @player.password == login_params[:password]
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update_role
    @player = Player.find(role_params[:id])
    @player.role = role_params[:role]
    if @player.save
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:username, :email, :password, :role)
    end

    def login_params
      params.require(:player).permit(:email, :password)
    end

    def role_params
      params.require(:player).permit(:id, :role)
    end
end
