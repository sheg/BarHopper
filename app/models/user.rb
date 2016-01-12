class User < ActiveRecord::Base


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :uniqueness => true,
            :presence => true, :length => { maximum: 50 },
            :format => { :with => VALID_EMAIL_REGEX }

  validates :password, :length => { minimum: 6 }

end