Rails.application.routes.draw do
   # Root path (головна сторінка сайту)
   root "books#index"

   # Маршрути для користувачів
   resources :users do
     # Лише авторизовані користувачі можуть додавати відгуки
     resources :reviews, only: [:create, :destroy]
   end
 
   # Маршрути для бібліотекарів
   resources :librarians, only: [:index, :edit, :update] do
     member do
       get :manage_books
     end
   end
 
   # Маршрути для адміністраторів (керування користувачами)
   resources :moderators, only: [:index, :destroy]
 
   # Маршрути для книг (включно з відгуками)
   resources :books do
     collection do
       get :search_by_title
       get :search_by_category
     end
 
     # Відгуки на книги
     resources :reviews, only: [:index]
   end
 
   # Маршрути для категорій
   resources :categories, only: [:index, :show]
 
   # Додатковий маршрут для сторінки стану системи
   get "up" => "rails/health#show", as: :rails_health_check
  end