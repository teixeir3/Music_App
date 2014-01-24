MusicApp::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :bands
  resources :albums
  resources :tracks
  resources :notes

end
