Rails.application.routes.draw do
  resources :categories do
    resources :todos do
      member { patch :toggle }
    end
  end

  root "categories#index"
  get "my-brags-document" => "brags#document", as: :my_brags_document
end
