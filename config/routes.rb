Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails do
    post :index
    resources :doses
  end
end
