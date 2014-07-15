class User < ActiveRecord::Base

  has_many :trades, dependent: :destroy
  has_secure_password
  acts_as_voter

  validates :first_name, :last_name, presence: true
  validates :username, presence: true,
                       uniqueness: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 6,
                                 message: 'must be at least 6 characters'}

end
