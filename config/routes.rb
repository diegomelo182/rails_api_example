Rails.application.routes.draw do
  # my api
  namespace :api do
    namespace :v1 do
      scope '/guests' do
        get '/', to: 'guest#index'
        post '/', to: 'guest#create'
        get '/:id', to: 'guest#show'
        put '/:id', to: 'guest#update'
        patch '/:id', to: 'guest#update'
        delete '/:id' ,to: 'guest#destroy'
      end

      scope '/users' do
        get '/', to: 'user#index'
        post '/', to: 'user#create'
        get '/:id', to: 'user#show'
        patch '/:id', to: 'user#update'
        delete '/:id', to: 'user#destroy'
      end
    end
  end

end
