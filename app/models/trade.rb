class Trade < ActiveRecord::Base

  belongs_to :user
  has_many :packages, dependent: :destroy
  acts_as_votable

  accepts_nested_attributes_for :packages

end
