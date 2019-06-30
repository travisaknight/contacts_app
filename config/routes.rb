Rails.application.routes.draw do
  namespace :api do
    get "/contacts" => "contacts#index"
    post "/contacts" => "contacts#create"
    get "/contacts/:id" => "contacts#show"
    patch "/contacts/:id" => "contacts#update"
    delete "/contacts/:id" => "contacts#destroy"
  end
end

# "/contacts/:id/:first_name/:last_name/:email/:phone_number"
# "/contacts/?id=1&first_name=travis&last_name"
