#!/usr/bin/ruby

require "uri"
require "net/https"
require 'json'


def request(url)
url = URI(url)


https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
JSON.parse (response.read_body)
end

body = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=c3vYTk5lHrjjBLR04kaWLThlsipRNGnIJ1VYg7qh")


a = body.values



File.open('nasa.html','w') do |f|
f.puts "<!DOCTYPE html>\n
   <html lang='en'>\n
	<head>\n
		<meta charset='UTF-8'>\n
		<meta name='viewport' content='width=device-width, initial-scale=1.0'>\n
		<meta http-equiv='X-UA-Compatible' content='ie=edge'>\n
		<title>Document</title>\n
		</head>\n
	<body>\n
	<ul>"
	for j in 0..a[0].length
	a[0][j].each do |k,v|
	f.puts " <li><img src='#{v}'></li>" if k=="img_src"
	
	end
	end
	
	f.puts "</ul>\n
		<body>\n
		</html>"
	
	end