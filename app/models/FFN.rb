class FFN

  def self.
    api_key = ENV['FFN_API_KEY']
    api_call = HTTParty.get("http://www.fantasyfootballnerd.com/service/players/json/")["Players"]
  end

end
