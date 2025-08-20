Rails.application.routes.draw do
  resources :todos do
    member do
      patch :toggle
    end
  end
  root "todos#index"
  get "my-brags" => "brags#index", as: :my_brags
end
