Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'api#index'
  post '/send', format: :json, to: 'api#send_email'
end
