Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get '/feed/:id', to: 'post#show'
  get 'relationship/followers/', to: 'relationship#follower'
  get 'relationship/following/', to: 'relationship#following'
  post 'relationship/follow/', to: 'relationship#follow'
  post 'relationship/unfollow/', to: 'relationship#unfollow'
  post 'relationship/accept/', to: 'relationship#accept'
  post 'relationship/reject/', to: 'relationship#reject'
  get 'relationship/find/:nickname', to: 'relationship#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
