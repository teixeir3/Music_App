class TracksController < ApplicationController

  def new
    @album = Album.find_by_id(params[:album_id])
  end

  ##########

  # def index
#     @tracks = Track.all
#     redirect_to
#   end

  def show
    @track = Track.find_by_id(params[:id])
  end


  def create
    @track = Track.new(:title => params[:track][:title],
                        :album_id => params[:track][:album_id],
                        :lyrics => params[:track][:lyrics],
                        :live => params[:track][:bonus],
                        :ord => params[:track][:ord])

    if @track.save
      flash[:notice] = "Track Successfully added! Rock on dude!"
      redirect_to track_url(@track)
    else
      fail
      flash[:error] = "You screwed up adding the track, dude!"
      redirect_to new_track_url
    end


  end

  def update
    @track = Track.find_by_id(params[:id])
    @album = @track.album
    @track.update_attributes(params[:track])
    redirect_to album_url(@album)
  end


  def destroy
    @track = Track.find_by_id(params[:id])
    @album = @track.album
    @track.destroy

    redirect_to album_url(@album)
  end

  def edit
    @balbum = Album.find_by_id(params[:id])
    render :edit
  end
end
