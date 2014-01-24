# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#



class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :session_token
  attr_reader :password


  validates :email, :password_digest, :session_token, :presence => true
  validates :email, :uniqueness => true
  after_initialize :ensure_session_token

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
      BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end


  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, secret)
    #verify there's a user in db with this email
    #if there is, verify their secret pw with helpers
    current_user = User.find_by_email(email)

    return nil unless current_user
    current_user.is_password?(secret) ? current_user : nil

  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
