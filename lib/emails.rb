require 'open-uri'
require 'nokogiri'

market = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

def symbol (market)
	arr_s = []
	bitcoin = market.xpath("//tr/td[3]")
	bitcoin.each do |name| 
		arr_s << name.text
	end
	return arr_s
end

def values (market)
	arr_v = []
	value = market.xpath("//tr/td[4]")
	value.each do |v|
		arr_v << v.text.tr('$', '')
	end
	return arr_v
end

def all (market)
	arr_all = values(market.zip)(symbol(market)).map{|x| x.to_h}
	puts arr_all
end

all
