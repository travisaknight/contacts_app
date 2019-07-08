class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    if params[:search]
      @contacts = @contacts.where("first_name ILIKE ?", "%#{params[:search]}%")
    end

    render "index.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
    )

    if @contact.save
      render "show.json.jb"
    else
      render json: { hold_up: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.save

    if @contact.save
      render "show.json.jb"
    else
      render json: { hold_up: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: { message: "You've been erased from my life. Fare thee well, Felicia." }
  end
end
