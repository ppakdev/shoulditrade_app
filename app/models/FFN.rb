class FFN

  def self.seed
    api_key = ENV['FFN_API_KEY']
    api_call = HTTParty.get("http://www.fantasyfootballnerd.com/service/players/json/#{api_key}")["Players"]
  end

end
