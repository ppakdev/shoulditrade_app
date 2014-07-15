class FFN

  def self.seed
    api_call = HTTParty.get("http://www.fantasyfootballnerd.com/service/players/json/nge59mjr2nyz")["Players"]
  end

end
