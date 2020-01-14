#!/usr/bin/ruby

require "uri"
require "net/https"
require 'json'

url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=c3vYTk5lHrjjBLR04kaWLThlsipRNGnIJ1VYg7qh")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
body = JSON.parse (response.read_body)
puts body



