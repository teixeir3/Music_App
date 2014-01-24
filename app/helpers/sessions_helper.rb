module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:token] = user.session_token
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logged_in?(user)
    # returns true if session[:token] = user.session_token
    user.session_token == session[:token]
  end

  def log_in_user!(user)
    # add's user credentials to session cookie
    session[:token] = user.session_token
  end
end
