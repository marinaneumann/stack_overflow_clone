class User <ActiveRecord::Base
  has_secure_password
  validates :email, :password, :password_confirmation, :presence => true
  validates_uniqueness_of :email

  has_many :questions
  has_many :answers
end
