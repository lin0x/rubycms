Rails.application.routes.draw do
  
  root 'home#index'
  resources :home
  resources :posts
  resources :analytics
  resources :blog do
    resources :posts
  end

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  resources :ckeditor
  resources :categories, only:[:show]
  resources :pages, only:[:show]

  namespace :admin do
    resources :admins
    resources :posts
    resources :pages
    resources :categories
    devise_for :users, controllers:{
      sessions: 'user/sessions',
      registration: 'user/registration',
      confirmation: 'user/confirmation',
      passwords: 'user/passwords'
    }
    resources :menus
  end


 # Page.where.not("slug", nil).all.each do |page|
 #   if page.slug != "admin" && page.slug != "Admin"
 #     get "/#{page.slug}",controller: "pages",action: "show",id: page.id
 #   end
 # end
  
  get '/blog'             =>    'blog#index'
  get '/admin'            =>    'admin/admins#index'
  get '/index'            =>    'pages#index'
  get '/'                 =>    'pages#index'
  get '/blog/posts/:id'   =>    'posts#show'
  
  #get '*unmatched_route'  =>  'application#not_found'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
