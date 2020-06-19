Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :customers, only:[:index, :new, :create, :edit, :update] do
  #   resources :contracts, only:[:new, :create]
  # end
  # resources :contracts, only:[] do
  #   resources :insure_trad_supps, only:[:new, :create, :show]
  # end

  resources :customers, shallow: true, only:[:index, :new, :create, :edit, :update] do
    resources :contracts, shallow: true,  only:[:new, :create] do
      resources :insure_trad_supps, shallow: true, only:[:new, :create, :show] do
        resources :options, only:[:new, :create, :edit, :update]
        resources :customer_contacts, only:[:new, :create, :edit, :update]
        resources :customers_infos, only:[:new, :create, :edit, :update]
        resources :primary_insurances, only:[:new, :create, :edit, :update] do
          resources :loss_payees, only:[:new, :create, :edit, :update]
        end
      end
    end
  end
  get '/insure_trad_supps/:id/createpdf', to: 'insure_trad_supps#creationpdf', as: 'creation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
