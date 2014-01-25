class NotesController < ApplicationController

  def new
  end

  def create
    @track = Track.find_by_id(params[:track_id])
    @note = Note.new(:text => params[:note][:text], :track_id => params[:track_id], :user_id => current_user.id)

    if @note.save
      flash[:notice] = "Note added successfully!"
      redirect_to track_url(@track)
    else
      fail
      flash[:error] = "An error has occured. Note not added!"
      redirect_to track_url(@track)
    end
  end

  # def update
 #
 #  end

  def destroy
    @note = Note.find_by_id(params[:id])
    @note.destroy

    redirect_to track_url(@track)
  end

  # def edit
 #
 #  end
 #
  def show
    redirect_to track_url(@track)
  end
end
