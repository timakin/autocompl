Rails.application.routes.draw do
  resources :makers do
    get 'autocomplete_endpoint', on: :collection
  end

  resources :products do
    get 'autocomplete_endpoint', on: :collection
  end
end
