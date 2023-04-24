Rails.application.routes.draw do
  resources :doctors, only: [:show] do
    resources :patients, only: [:index, :destroy]
  end
end
