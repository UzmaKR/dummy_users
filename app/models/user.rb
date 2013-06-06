require 'bcrypt'

class User < ActiveRecord::Base
  
  include BCrypt

  validates_presence_of :first_name, :last_name, :email
  validates_length_of :last_name, minimum: 3, maximum: 20
  validates_length_of :password_digest, minimum: 8
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password_digest, :confirmation => true
  has_many :urls

  # before_save :create_password

  def self.authenticate(email,password_digest)
    user = User.find_by_email(email)
    # new_digest = Password.create(password_digest)
      if user && (user.password_digest == password_digest)
        return user
      else
        return nil
      end
  end

  def create_password
    self.password_digest = Password.create(self.password_digest)
  end

end
