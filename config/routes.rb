Rails.application.routes.draw do
  resources :webhooks, only: %i[new create] do
    resources :handlers, only: %i[index new create destroy]
  end

  namespace :api do
    post "/webhooks/:id", to: "webhooks#receive", as: :webhook
  end

  root to: "webhooks#new"
end
