Rails.application.routes.draw do
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations'
  }
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations'
  }
  root 'welcome#index'
end
