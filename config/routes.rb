MusicApp::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new, :create, :index]
  end

  resources :albums, only: [:show, :edit, :update, :destroy] do
    resources :tracks, only: [:new, :create, :index]
  end

  resources :tracks, only: [:show, :edit, :update, :destroy] do
    resources :notes
  end



#   resources :notes

end
