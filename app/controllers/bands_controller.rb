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

  end

  def destroy

  end

  def edit

  end
end
