class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:show, :edit, :destroy]

  # GET /friend_requests
  # GET /friend_requests.json
  def index
    @friend_requests = FriendRequest.all
  end

  # GET /friend_requests/1
  # GET /friend_requests/1.json
  def show
  end

  # GET /friend_requests/new
  def new
    @friend_request = FriendRequest.new
  end

  # GET /friend_requests/1/edit
  def edit
  end

  # POST /friend_requests
  # POST /friend_requests.json
  def create
    if current_user.friends.exists?(params[:friend_request][:receiver_id])
      redirect_to users_show_path(current_user), flash: {notice: "You are already friend"}
    else
      @friend_request = FriendRequest.new(friend_request_params.merge(sender_id: current_user.id))
      respond_to do |format|
        if @friend_request.save
          format.html { redirect_to @friend_request, notice: 'Friend request was successfully created.' }
          format.json { render :show, status: :created, location: @friend_request }
        else
          format.html { render :new }
          format.json { render json: @friend_request.errors, status: :unprocessable_entity }
        end
      end

    end


  end

  # PATCH/PUT /friend_requests/1
  # PATCH/PUT /friend_requests/1.json
  def update
    @friend_request = FriendRequest.where(receiver_id: current_user.id,sender_id: params[:id]).last

    if @friend_request.update(:status_id => params[:status_id])
      flash[:notice] = "FriendRequest has been #{params[:status_id]}."
    end
    redirect_to users_show_path(current_user)
  end

  # DELETE /friend_requests/1
  # DELETE /friend_requests/1.json
  def destroy
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to friend_requests_url, notice: 'Friend request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_request_params
      params.require(:friend_request).permit(:sender_id, :receiver_id, :status_id)
    end
end
