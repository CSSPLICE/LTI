Rails.application.routes.draw do
  get 'lti/launch'
  post 'lti/launch'
  get 'calculator', to: 'calculator#calculator'
  root 'calculator#calculator'
end
