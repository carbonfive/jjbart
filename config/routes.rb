Rails.application.routes.draw do
  get 'arrivals/:station' => 'arrivals#show'
  resources :stations, contraints: { format: 'json'}
end
