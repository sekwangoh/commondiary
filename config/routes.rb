Rails.application.routes.draw do
  resources :posts do
    post 'like', to: 'likes#like_post_toggle'
    resources :comments do
      post 'like', to: 'likes#like_comment_toggle'
    end
  end




  root 'welcome#index'

  devise_for :users, :controller => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
