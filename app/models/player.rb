class Player < ActiveRecord::Base

  has_and_belongs_to_many :packages

  validates :name, :position, :team, presence: true

end
