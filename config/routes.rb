Rails.application.routes.draw do
  get 'users/index'
  get '/user/:id', to: 'users#set_user', as: :user
  devise_for :users, :controllers => {
  registrations: 'registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "events#index"
  resources :events do
    member do
      get 'accept_invitation'
      get 'cancel_invitation'
    end
  end
end
