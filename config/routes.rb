require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :v1, defaults: {format: :json} do
    constraints type: /viber|telegram|whatsapp/ do
      post ':type', to: 'messages#create'
      get ':type/:guid', to: 'messages#show'
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end

