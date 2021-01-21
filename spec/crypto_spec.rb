require_relative '../lib/darktrader'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   

describe "c_hash" do
  it "no erreur & no nil" do
      expect(array_crypto(page)).not_to be_empty 
  end
  it "retrieves the price of all cryptocurrencies" do
      expect(r).to eq ({"BTC"=>"32,217.52"})
  end
end 