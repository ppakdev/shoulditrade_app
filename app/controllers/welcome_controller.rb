class WelcomeController < ApplicationController

  def index
    if session[:my_auth_hash]
      url = "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games?"
      url += "oauth_consumer_key=dj0yJmk9M3V1OVkzY1puM2N4JmQ9WVdrOWJERTJXV04wTjJzbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1iYQ--&"
      url += "oauth_token=#{session[:my_auth_hash]["credentials"]["token"]}&"
      url += "oauth_signature_method=PLAINTEXT&"
      url += "oauth_version=1.0&"
      url += "oauth_signature=5aa0ba383f9a12b7bd054aac7f08001c16a836c2%265d96fa244bab5db16d68be7603b799803e4956ab"
      @response = HTTParty.get(url)
    end
  end

end
