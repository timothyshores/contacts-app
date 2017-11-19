class ContactsController < ApplicationController

  def index
    render json: Contact.all.as_json
  end

  def show
    render json: Contact.find_by(id: params[:id]).as_json
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    contact.save
    render json: contact.as_json
  end

  def update
    contact_id = params["contact_id"] 
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params["first_name"] || contact.first_name
    contact.last_name = params["last_name"] || contact.last_name
    contact.email = params["email"] || contact.email
    contact.phone_number = params["phone_number"] || contact.phone_number
    contact.save
    render json: contact.as_json
  end

  def destroy
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    render json: {message: "Contact deleted"}
  end
end
