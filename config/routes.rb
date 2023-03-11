Rails.application.routes.draw do
  resources :certificates do
    collection do
      post :import
      get :verify
    end
  end
  resources :groups
  resources :certificate_templates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
