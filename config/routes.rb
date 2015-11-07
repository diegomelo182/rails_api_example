Rails.application.routes.draw do
  # my api
  namespace :api do
    namespace :v1 do
      scope '/guest' do
        get '/', to: 'guest#index'
        post '/', to: 'guest#create'
        get '/:id', to: 'guest#show'
        put '/:id', to: 'guest#update'
        patch '/:id', to: 'guest#update'
        delete '/:id' ,to: 'guest#destroy'
      end
    end
  end

end
