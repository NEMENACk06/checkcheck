Rails.application.routes.draw do
  resources :todos, only: [ :index, :create, :destroy ] do
    member do
      patch :toggle
    end
  end
  root "todos#index"
  get "my-brags" => "brags#index", as: :my_brags

  match "*path", to: redirect("/"), via: :all
end
