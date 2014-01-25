class SessionsController < ApplicationController

  def new
  end

  def create
    # should reset user's session token and session[:token]
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user.nil?
      flash[:error] = "Incorrect credentials, dude!"
      redirect_to new_session_url
    elsif @user.activated
      flash[:notice] = "Welcome back, #{@user.email} dude!"
      session[:token] = @user.session_token
      redirect_to user_url(@user)
    else
      flash[:error] = "You must first activate your account from the link provided in the email."
      redirect_to new_session_url
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil

    redirect_to new_user_url
  end
end
