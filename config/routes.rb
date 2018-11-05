require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :v1, defaults: {format: :json} do
    constraints provider: /viber|telegram|whatsapp/ do
      post ':provider', to: 'messages#create'
      get ':provider/:guid', to: 'messages#show'
    end

    post 'package', to: 'packages#create'
    get 'package/:guid', to: 'packages#show'
  end

  mount Sidekiq::Web => '/sidekiq'
end

