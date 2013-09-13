class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: /\@/

  def self.authenticate(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end

end
