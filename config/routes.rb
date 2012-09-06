Mgs::Application.routes.draw do
  resources :penalties
  resources :dares

  resources :games do
    resources :players
  end
  match 'games/question' => 'games#question', :via => :post
  root :to => "home#index"
end
