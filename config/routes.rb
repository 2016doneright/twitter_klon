Rails.application.routes.draw do

  get 'activities/mine', to: "activities#mine", as: "activities_show"
  get 'activities/following', to: "activities#following", as: "activities_following"

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "/guest", to: "profiles#guest", as: "single_sing_on"
  # You can have the root of your site routed with "root"
  authenticated :user do
    root to: 'base#feed', as: :authenticated_root
  end
  
  get '/tooltip', to: 'profiles#tooltip'
  
  root 'profiles#guest'
  
  get '/:profile_name',     to: "profiles#show",        as: "get_profile"
  
  resources :retweets, only: [:create, :destroy]
  
  scope '/:profile_name' do
    get 'following', to: 'profiles#following', as: 'following_users'
    get 'followers', to: 'profiles#followers', as: 'users_followers'
    get 'likes', to: 'profiles#likes', as: 'likes_tweets'
    get 'dislikes', to: 'profiles#dislikes', as: 'dislikes_tweets'
  end
  
  put :follow,              to: "profiles#follow",      as: "follow_person"
  put :unfollow,            to: "profiles#unfollow",    as: "unfollow_person"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  put :follow_around,       to: "around#follow", as: "follow_person_around"
  put :unfollow_around,     to: "around#unfollow", as: "unfollow_person_around"
  
  resources :tweets do
    member do
      put     :like,   to: "tweets#like",   as: "like_this"
      delete  :unlike, to: "tweets#unlike", as: "unlike_this"
    end
  end
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
