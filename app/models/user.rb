# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  password_digest  :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :boolean          default(FALSE), not null
#  activation_token :string(255)      default("INACTIVE"), not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :session_token
  attr_reader :password


  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many(
    :notes,
    :class_name => 'Note',
    :foreign_key => :user_id,
    :primary_key => :id,
    :dependent => :destroy
  )

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

  def generate_activation_token
    self.activation_token = SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, secret)
    current_user = User.find_by_email(email)

    return nil unless current_user
    current_user.is_password?(secret) ? current_user : nil

  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
