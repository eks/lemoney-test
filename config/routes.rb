Rails.application.routes.draw do
  resources :offers do
    member do
      get :toggle_state
    end
  end
end
