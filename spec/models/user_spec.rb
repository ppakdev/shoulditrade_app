require 'rails_helper'

describe User do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:username)}
  it { should validate_uniqueness_of(:email)}
  it { should have_secure_password }


  #
  # let(:peter) { User.new( username: "testguy",
  #                         first_name: "peter",
  #                         last_name: "pak",
  #                         email: "ppakdev@gmail.com",
  #                         password: "qwerty",
  #                         password_confirmation: "qwerty",
  #                         image_url: "http://lorempixel.com/200/200/sports/"
  #   )}

end
