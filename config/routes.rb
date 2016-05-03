require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :posts
      post 'authenticate', to: 'authentication#authenticate'
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: :true) do
      resources :posts
      post 'authenticate', to: 'authentication#authenticate'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # post 'authenticate', to: 'authentication#authenticate'
end
