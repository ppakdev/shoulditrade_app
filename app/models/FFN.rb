class FFN < ActiveRecord::Migration

  def self.seed
    api_key = env['FFN_API_KEY']
    api_call = HTTParty.get("http://www.fantasyfootballnerd.com/service/players/json/#{api_key}")["Players"]
  end

end
