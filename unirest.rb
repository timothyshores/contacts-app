require "Unirest"
require "pp"

puts "First Contact " + Unirest.get("http://localhost:3000/first_contact").body.to_s
puts "All Contacts" + Unirest.get("http://localhost:3000/all_contacts").body.to_s