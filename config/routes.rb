Rails.application.routes.draw do
  devise_for :users, :controller => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :users, only: [:index, :show]

end
