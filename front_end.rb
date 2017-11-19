  require "unirest"
  require "pp"

  print "Press C to create, U to update or D to delete: "
  input = gets.chomp

  if input == 'C'
    params ={}
    print "Enter the new contact's first name: "
    params["first_name"] = gets.chomp.to_s
    print "Enter the new contact's last name: "
    params["last_name"] = gets.chomp.to_s
    print "Enter the new contact's email address: "
    params["email"] = gets.chomp.to_s
    print "Enter the contact's phone number: "
    params["phone_number"] = gets.chomp.to_s

    contact = Unirest.post("http://localhost:3000/contacts", parameters: params).body
    pp contact

  elsif input == 'U'
    print "Enter the contact's ID number that you'd like to update: "
    contact_id = gets.chomp
    params ={}
    params["contact_id"] = contact_id
    print "Enter the contact's first name: "
    params["first_name"] = gets.chomp.to_s
    print "Enter the contact's last name: "
    params["last_name"] = gets.chomp.to_s
    print "Enter the contact's email address: "
    params["email"] = gets.chomp.to_s
    print "Enter the contact's phone number: "
    params["phone_number"] = gets.chomp.to_s

    contact = Unirest.patch("http://localhost:3000/contacts/#{contact_id}", parameters: params).body
    pp contact

  elsif input == 'D'
    print "Enter the contact's ID number that you'd like to update: "
    contact_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/contacts/#{contact_id}")
    contact = response.body
    pp contact
  end
