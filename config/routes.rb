Rails.application.routes.draw do
  get 'promote_activities/index'
  get 'pages/index'
  get 'user_page/:user_id', to: 'pages#user_page', as: 'user_page'

  post 'activity/:user_id', to: 'user_activities#create', as: 'asigne_activity'
  get 'edit/:user_id/:activity_id', to: 'user_activities#edit', as: 'edit_activity'
  delete 'activity/:user_id/:activity_id', to: 'user_activities#destroy', as: 'destroy_activity'
  patch 'edit/:user_id/:activity_id', to: 'user_activities#update', as: 'update_activity'

  post 'new_activity/:user_id', to: 'activities#create', as: 'new_activity'
  get 'edit_new_user_activity/:user_id/:activity_id', to: 'activities#edit', as: 'edit_new_user_activity'
  patch 'update_new_activity/:activity_id', to: 'activities#update', as: 'update_new_activity'
  
  get 'promote_activities/:user_id', to: 'promote_activities#index', as: 'promote_activities'
  get 'new_promote', to: 'promote_activities#new', as: 'new_promote'
  post 'create_promote/:user_id', to: 'promote_activities#create', as: 'create_promote'
  delete 'promote/:id', to: 'promote_activities#destroy', as: 'destroy_promote'

  post 'contacts/:id', to: 'contacts#create', as: 'contacts'
  delete 'contacts/:id', to: 'contacts#destroy', as: 'destroy_contacts'

  resources :billings, only: [:index] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end

  devise_for :users, controllers: {
        registrations: 'user/registrations'
      }

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
