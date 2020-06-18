class PiecesController < ApplicationController
  before_action :set_artist, except: [:index_all]
  before_action :set_piece, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:create, :update, :destroy]
  before_action :is_this_mine, only: [:update, :destroy]

  # GET /pieces
  def index_all
    @pieces = Piece.all

    render json: @pieces
  end

  def index
    @pieces = @artist.pieces

    render json: @pieces
  end

  # GET /artists/:artist_id/pieces/1
  def show
    render json: @piece
  end

  # POST /artists/:artist_id/pieces
  def create
    @piece = Piece.new(piece_params)
    @piece.artist = @current_artist

    if @piece.save
      render json: @piece, status: :created, location: @piece
    else
      render json: @piece.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pieces/1
  def update
    if @piece.update(piece_params)
      render json: @piece
    else
      render json: @piece.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pieces/1
  def destroy
    @piece.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_piece
      @piece = Piece.find(params[:id])
    end

    def is_this_mine
      if @piece.artist_id != @current_artist.id
        render json: { errors: "unauthorized" }, status: :unauthorized
      end
    end

    # Only allow a trusted parameter "white list" through.
    def piece_params
      params.require(:piece).permit(:name, :description, :artist_id)
    end
end
