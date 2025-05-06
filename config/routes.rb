Rails.application.routes.draw do
  # Root page showing list of questions
  root 'questions#index'

  # User signup
  get 'signup', to: 'users#new'  # Show sign-up form
  post 'signup', to: 'users#create'  # Handle sign-up submission

  # Login/logout routes
  get 'login', to: 'sessions#new'  # Login page route
  post 'login', to: 'sessions#create'  # Login form submission
  get 'logout', to: 'sessions#destroy', as: :logout  # Logout route
  resources :users, only: [:new, :create]
  # Questions routes (index, show, new, create, upvote)
  resources :questions, only: [:index, :show, :new, :create] do
    # Upvote action
    post 'upvote', on: :member

    # Nested comments under questions
    resources :comments, only: [:create]
  end

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check
end
