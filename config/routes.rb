Rails.application.routes.draw do
  get 'pages/index'
  root to: 'pages#index'

  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
