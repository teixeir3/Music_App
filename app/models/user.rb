class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :session_token
  attr_reader :password

  before_initialize :ensure_session_token

  def password=(secret)

  end

  def is_password?(secret)

  end

  def reset_session_token!

  end

  def self.find_by_credentials

  end

  def self.generate_session_token

  end

  def self.find_by_credentials(email, secret)
    #verify there's a user in db with this email
    #if there is, verify their secret pw with helpers

  end

  def ensure_session_token

  end
end
