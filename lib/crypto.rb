require 'open-uri'
require 'nokogiri'


def darktrader
	
	doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
	arr_b = []
	arr_v = []

	bitcoin = doc.xpath("//tr/td[3]")
	value = doc.xpath("//tr/td[4]")

	bitcoin.each do |name| 
		arr_b << name.text
	end

	value.each do |v|
		arr_v << v.text.tr('$', '')
	end

	r = Hash[arr_b.zip(arr_v)]

	print r
end

darktrader





	
	  
