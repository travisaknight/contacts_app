Rails.application.routes.draw do
  namespace :api do
    get "/contacts" => "contacts#one_contact"
  end
end
