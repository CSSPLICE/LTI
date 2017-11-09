Rails.application.routes.draw do


  get 'quiz/index'

  resources :questions
  post 'questions/submitQuestion'=>'questions#submitQuestion', as: :submit_question

  root 'sessions#login'
  get "signup", :to => "users#new"
  get "login", :to => "sessions#login"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "sessions#profile"
  get "setting", :to => "sessions#setting"
  post "signup", :to => "users#new"
  post "login", :to => "sessions#login"
  post "logout", :to => "sessions#logout"
  post "login_attempt", :to => "sessions#login_attempt"
  get "login_attempt", :to => "sessions#login_attempt"
  post "user_create", :to => "users#create"
  get "all", :to => "questions#index"
  get "result", :to => "questions#result"
end
