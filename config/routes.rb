Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  get  'blogs'     => 'blogs#index'
  get  'blogs/new' => 'blogs#new'
  post 'blogs'     => 'blogs#create'
  delete 'blogs/:id'  => 'blogs#destroy'
  patch   'blogs/:id'  => 'blogs#update'
  get   'blogs/:id/edit'  => 'blogs#edit'
  get 'blogs/:id' => 'blogs#show'
  get   'users/:id'   =>  'users#show'
end
