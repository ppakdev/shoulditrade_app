class SessionsController < ApplicationController
  def create
    session[:my_auth_hash] = auth_hash
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    redirect_to '/'
  end

  def yahoo_info
     def prepare_access_token(oauth_token, oauth_token_secret)
            consumer = OAuth::Consumer.new("dj0yJmk9M3V1OVkzY1puM2N4JmQ9WVdrOWJERTJXV04wTjJzbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1iYQ--", "5aa0ba383f9a12b7bd054aac7f08001c16a836c2",
                { :site => "hhttp://fantasysports.yahooapis.com/"
                })
            # now create the access token object from passed values
            token_hash = { :oauth_token => oauth_token,
                                         :oauth_token_secret => oauth_token_secret
                                     }
            access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
            return access_token

        end
        auth = current_user.authentications.find(:first, :conditions => { :provider => 'yahoo' })

        # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
        access_token = prepare_access_token(auth['token'], auth['secret'])

        # use the access token as an agent to get the home timeline
        response = access_token.request(:get, "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=223/teams")

        render :json => response.body
      end
  

  # def create
  #   auth = request.env['rack.auth']
  #   unless @auth = Authorization.find_from_hash(auth)
  #     # Create a new user or add an auth to existing user, depending on
  #     # whether there is already a user signed in.
  #     @auth = Authorization.create_from_hash(auth, current_user)
  #   end
  #   # Log the authorizing user in.
  #   self.current_user = @auth.user
  #
  #   render :text => "Welcome, #{current_user.name}."
  # end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
