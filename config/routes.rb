Rails.application.routes.draw do
  
  scope module: 'admin' do
    devise_for :admin, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
  end

  scope module: 'end_users' do
    devise_for :end_users, controllers: {
      sessions: 'end_users/end_users/sessions',
      registrations: 'end_users/end_users/registrations',
      passwords: 'end_users/end_users/passwords'
    }
  end

  namespace :admin do
    root 'top#top'
    resources :end_users
  end

  resource :end_users do
    collection do
      get :confirm
      delete :cancel
    end
  end

  root 'items#top'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
