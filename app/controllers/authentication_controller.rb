class AuthenticationController < ApplicationController
  before_action :authorize_request, only: [:verify] 

  def login
    @artist = Artist.find_by_username(login_params[:username])
    if @artist.authenticate(login_params[:password])
      @token = encode({ artist_id: @artist.id })
      render json: { artist: @artist, token: @token }, status: :ok
    else
      render json: { errors: "unauthorized" }, status: :unauthorized
    end
  end

  def verify
    render json: @artist, status: :ok
  end

  private
    def login_params
      params.require(:auth).permit(:username, :password)
    end
end
