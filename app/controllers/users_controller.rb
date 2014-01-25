class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email])
    @user.password = params[:user][:password]

    if @user.save
      msg = UserMailer.new_user_email(@user)
      msg.deliver!

      flash[:notice] = "New user '#{@user.email} created! Click the link in your email to activate your account"
      # self.current_user = @user
      redirect_to new_session_url
      # redirect_to sessions_url, method: :post
    else
      flash[:error] = "Failed to create user! Try again:"
      redirect_to new_user_url
    end
  end

  def show
    @user = current_user
  end

  def activate
    @user = User.find_by_id(params[:id])
    @user.activated = true if @user.activation_token = params[:activation_token]

    if @user.activated
      flash[:notice] = "New user '#{@user.email} activated!"
      self.current_user = @user
      redirect_to bands_url
    else
      flash[:error] = "An Error has occured! Your account is not activated! Try again!"
      redirect_to new_user_url
    end
  end
end
