Rails.application.routes.draw do

  devise_for :users
  resources :applications
  root 'welcome#home'

end
