class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by_id(params[:id])
  end

  def new
  end

  def create
    @band = Band.new(:name => params[:band][:name])

    if @band.save
      flash[:notice] = "Band Successfully added! Rock on dude!"
    else
      flash[:error] = "You screwed up adding the band, dude!"
    end

    redirect_to bands_url
  end

  def update
    @band = Band.find_by_id(params[:id])
    @band.update_attributes(params[:band])
    redirect_to band_url(@band)
  end


  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy

    redirect_to bands_url
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end
end
