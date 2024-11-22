Rails.application.routes.draw do

  resources :books do
    resources :reviews, only: [:new, :create] # Додаємо nested маршрути для відгуків
  end
  # Root path (головна сторінка сайту)
  root "books#index"

  # Маршрути для користувачів
  resources :users do
    resources :reviews, only: [:create, :destroy] # Авторизовані відгуки
  end

  # Маршрути для бібліотекарів
  resources :librarians, only: [:index, :edit, :update] do
    member do
      get :manage_books
    end
  end

  # Адміністратори: керування користувачами
  resources :moderators, only: [:index, :destroy]

  # Книги
  resources :books do
    collection do
      get :search_by_title
      get :search_by_category
    end

    resources :reviews, only: [:index] # Відгуки на книги
  end

  # Категорії
  resources :categories, only: [:index, :show]

  # Сторінка стану системи
  get "up" => "rails/health#show", as: :rails_health_check
end
