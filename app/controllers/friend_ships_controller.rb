class FriendShipsController < ApplicationController
  before_action :set_friend_ship, only: [:show, :edit, :update, :destroy]

  # GET /friend_ships
  # GET /friend_ships.json
  def index
    @friend_ships = FriendShip.all
  end

  # GET /friend_ships/1
  # GET /friend_ships/1.json
  def show
  end

  # GET /friend_ships/new
  def new
    @friend_ship = FriendShip.new
  end

  # GET /friend_ships/1/edit
  def edit
  end

  # POST /friend_ships
  # POST /friend_ships.json
  def create
    @friend_ship = FriendShip.new(friend_ship_params)

    respond_to do |format|
      if @friend_ship.save
        format.html { redirect_to @friend_ship, notice: 'Friend ship was successfully created.' }
        format.json { render :show, status: :created, location: @friend_ship }
      else
        format.html { render :new }
        format.json { render json: @friend_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_ships/1
  # PATCH/PUT /friend_ships/1.json
  def update
    respond_to do |format|
      if @friend_ship.update(friend_ship_params)
        format.html { redirect_to @friend_ship, notice: 'Friend ship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend_ship }
      else
        format.html { render :edit }
        format.json { render json: @friend_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_ships/1
  # DELETE /friend_ships/1.json
  def destroy
    @friend_ship.destroy
    respond_to do |format|
      format.html { redirect_to friend_ships_url, notice: 'Friend ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_ship
      @friend_ship = FriendShip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_ship_params
      params.require(:friend_ship).permit(:user_id, :friend_id)
    end
end
