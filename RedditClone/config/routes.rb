Rails.application.routes.draw do
 resources :users, only:[:new,:create]
 resource :session, only:[:new,:create,:destroy]
 resources :subs, except:[:destroy] do
  resources :posts, only:[:create]
 end
 resources :posts, only:[:new,:edit, :update, :destroy]

end
