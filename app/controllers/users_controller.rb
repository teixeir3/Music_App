class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email])
    @user.password = params[:user][:password]

    if @user.save
      flash[:notice] = "New user '#{@user.email} created!"
      self.current_user = @user

      redirect_to new_user_url
      # redirect_to sessions_url, method: :post
    else
      flash[:error] = "Failed to create user! Try again:"
      redirect_to new_user_url
    end
  end

  def show
    @user = current_user
  end
end
