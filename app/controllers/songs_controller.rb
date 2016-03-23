class SongsController < ApplicationController
  def show
    @song = Song.find_by_id(params[:id])
  end
  def new
    @song = Song.new
  end
  def create
    song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(song)
  end
  def edit
    @song = Song.find_by_id(params[:id])
  end
  def update
    song = Song.find_by_id(params[:id])
    song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(song)
  end
  def index
    @songs = Song.all
  end
end