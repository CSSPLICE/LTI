Rails.application.routes.draw do
  get 'lti/launch'
  post 'lti/launch'
  get 'calculator/index'
  get 'calculator', to: 'calculator#calculator'
  root 'calculator#index'
end
