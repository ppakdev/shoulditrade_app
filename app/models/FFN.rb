class FFN

  def self.players
    api_key = ENV['FFN_API_KEY']
    ffn_url = "http://www.fantasyfootballnerd.com/service/players/json/#{api_key}"
    api_call = HTTParty.get(ffn_url)["Players"]
  end

end
