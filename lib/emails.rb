require 'open-uri'
require 'nokogiri'

# def get_townhall_email
# doc = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
#     doc.search('//td').each do |mail|
#         email = mail.content
#         print email.match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
#     end

# end
# get_townhall_email

valdoise = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_urls(valdoise) 

    arr_url = [] #récupère les liens des mairies
    villes_val = valdoise.search('.lientxt').map do |nom|
        arr_url << "https://www.annuaire-des-mairies.com/95/#{nom.text.downcase.tr(' ', '-')}.html"
    end
    return arr_url
end

def get_townhall_email(valdoise) #récupère les email
    arr_e = []
    get_townhall_urls(valdoise).map do |url|
    arr_e << Nokogiri::HTML(URI.open(url)).search('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    end
    return arr_e
end

def valdoise_arr(valdoise) #rassemble les deux array en hash
    hash_names_emails = get_townhall_urls(valdoise).zip(get_townhall_email(valdoise)).map{|x| [x].to_h}
    puts hash_names_emails
end

valdoise_arr(valdoise)





