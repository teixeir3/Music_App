class SessionsController < ApplicationController

  def new
  end

  def create
    # should reset user's session token and session[:token]
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user.nil?
      flash[:error] = "Incorrect credentials, dude!"
    else
      flash[:notice] = "Welcome back, #{@user.email} dude!"
    end

    # @user.reset_session_token!
    session[:token] = @user.session_token


    redirect_to show_users_url
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil

    redirect_to new_user_url
  end
end
