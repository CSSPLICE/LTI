Rails.application.routes.draw do
  root 'pages#index'
  get 'index' => 'pages#index'
  get 'tutorials/rails' => 'pages#railstutorial'
  get 'examples' => 'pages#examples'
  #get "pages/:page" => "pages#show"
  #get 'pages/examples' => 'pages#examples', as: "examples"
  # resources :pages do
  #   collection do
  #     get 'examples' => 'pages#examples'
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
