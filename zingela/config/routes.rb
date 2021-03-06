Rails.application.routes.draw do
  resources :community_growth_forms
  resources :report_communities
  resources :communities
  resources :species_families
  resources :species
  resources :locations
  resources :field_data
  resources :projects
  resources :welcomes
  devise_for :companies, controllers: { registrations: "companies/registrations" }
  devise_for :admins
  devise_for :users, controllers: { registrations: "user/registrations" }
  get '/sign_out' => 'devise/sessions#destroy'
  controller :manage do
    get 'manage/users'   => :users
    get 'edit/user/:id'   => :edit_user
    get 'edit/user/password/:id'   => :edit_user_password
    get 'new/user/'   => :new_user
    post 'create/user/'   => :create_user
    get 'delete/user/:id'   => :delete_user
    patch 'update/user/:id'   => :update_user
    patch 'update/user/password/:id'   => :update_user_password
    get 'manage/companies'     => :companies
    get 'edit/company/:id'   => :edit_company
    get 'edit/company/password/:id'   => :edit_company_password
    get 'delete/company/:id'   => :delete_company
    get 'new/company/'   => :new_company
    post 'create/company/'   => :create_company
    patch 'update/company/:id'   => :update_company
    patch 'update/company/password/:id'   => :update_company_password
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcomes#index'
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
