Rails.application.routes.draw do
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations'
  }
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }
  resources :time_availabilities
  resources :appointments

  root 'welcome#index'
end
