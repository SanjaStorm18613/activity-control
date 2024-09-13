Rails.application.routes.draw do

  devise_for :users
  
  # Define a rota autenticada como a página inicial
  authenticated :user do
    root to: 'atividades#index', as: :authenticated_root  # Página inicial para usuários logados
  end

  # Define a página de login como root quando não autenticado
  root to: 'devise/sessions#new'

  # Rotas para atividades
  resources :atividades do
    collection do
      get 'export_pdf'  
    end
  end

  # Rotas para mentores
  resources :mentores, only: [:index] do
    collection do
      get 'register_student', to: 'mentores#register_student', as: 'register_student'
      post 'create_student', to: 'mentores#create_student', as: 'create_student'
      get 'register_mentor', to: 'mentores#register_mentor', as: 'register_mentor'
      post 'create_mentor', to: 'mentores#create_mentor', as: 'create_mentor'
    end
  end
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end
end