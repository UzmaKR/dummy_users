class User < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :first_name, :last_name, :email
  validates_length_of :last_name, minimum: 3, maximum: 20
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def self.authenticate(email,password_digest)
      user = User.find_by_email(email)
      if user && (user.password_digest == password_digest)
        return user
      else
        return nil
      end
  end
end
