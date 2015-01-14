Rails.application.routes.draw do
  get 'arrivals/:station' => 'arrivals#show'
  resources :stations
end
