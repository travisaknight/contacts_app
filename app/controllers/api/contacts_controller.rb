class Api::ContactsController < ApplicationController

  def one_contact
    @contact = Contact.second
    render "contact.json.jb"
  end


end
