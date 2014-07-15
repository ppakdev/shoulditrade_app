class Package < ActiveRecord::Base

  belongs_to :trade
  has_and_belongs_to_many :players

end
