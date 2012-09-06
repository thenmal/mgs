Mgs::Application.routes.draw do
  resources :dares

  resources :games do
    resources :players
  end
  root :to => "home#index"
end
