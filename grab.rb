require 'nokogiri'
require 'open-uri'

def get_look(id)
	link = "http://www.lookatme.ru/looks/#{id}"
	puts "Adding look #{id}"
	doc = Nokogiri::HTML(open(link))
	
	pic = doc.css('img#j-look_image').first['src']
	File.open("public/pics/b#{id}.jpg", "wb") { |f| 
		f.write(open(pic).read) 
	}
	
	Look.create(:lid => id, :desc => pic)
	end
end
def get_page(id)
	link = "http://www.lookatme.ru/looks/recent?page=#{id}"
	doc = Nokogiri::HTML(open(link))
	
	doc.css('article.b-look a.pic').each do |it|
		look_href = /\/looks\/(\d*)/.match(it['href'])
		if(!look_href.nil?) then 
			
			look=look_href[1]
			get_look(look)
		end
	end
end
get_page(1)
		
		
		