class FavoritesController < ApplicationController
  #before_action :set_favorite, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /favorites or /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1 or /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites or /favorites.json
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
   
  end

 
  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)

  end

  #private
    # Use callbacks to share common setup or constraints between actions.
    #def set_favorite
    #  @favorite = Favorite.find(params.expect(:id))
    #end

    # Only allow a list of trusted parameters through.
    #def favorite_params
    #  params.expect(favorite: [ :user_id, :post_id ])
    #end
end
