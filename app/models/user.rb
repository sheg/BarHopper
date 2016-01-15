require 'securerandom'


class User < ActiveRecord::Base
  before_save { self.email = email.downcase.strip }
  before_create :set_auth_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :uniqueness => true,
            :presence => true, :length => { maximum: 50 },
            :format => { :with => VALID_EMAIL_REGEX }

  validates :password, :length => { minimum: 6 }

  has_secure_password

  private

  def set_auth_token
    if auth_token.present?
      return
    else
      self.auth_token = generate_auth_token
    end
  end

  def generate_auth_token
    SecureRandom.urlsafe_base64
  end
end
