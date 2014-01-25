class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by_id(params[:id])
  end

  def new
    @band = Band.find_by_id(params[:band_id])
  end

  def create
    @album = Album.new(:title => params[:album][:title],
                        :band_id => params[:band_id],
                        :year => params[:album][:year],
                        :live => params[:album][:live])

    if @album.save
      flash[:notice] = "Album Successfully added! Rock on dude!"
    else
      flash[:error] = "You screwed up adding the album, dude!"
    end

    redirect_to album_url(@album)
  end

  def update
    @album = Album.find_by_id(params[:id])
    @album.update_attributes(params[:album])
    redirect_to album_url(@album)
  end


  def destroy
    @album = Album.find_by_id(params[:id])
    @album.destroy

    redirect_to albums_url
  end

  def edit
    @balbum = Album.find_by_id(params[:id])
    render :edit
  end
end
