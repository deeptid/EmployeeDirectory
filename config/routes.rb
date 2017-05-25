Rails.application.routes.draw do
  resources :search_suggestions
  resources :employees
  # get 'welcome/index'
  resources :welcome 

   root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
