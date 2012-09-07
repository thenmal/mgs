Mgs::Application.routes.draw do
  resources :penalties
  resources :dares

  match 'games/penalty' => 'games#penalty', :via => :post
  match 'games/question' => 'games#question', :via => :post
  match 'games/:id(.:format)' => 'games#correct', :via => :post
  match 'games/:id(.:format)/reset' => 'games#reset', :via => :get
  root :to => "home#index"
  resources :games
end
