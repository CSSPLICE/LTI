Rails.application.routes.draw do
  get 'calculator', to: 'calculator#calculator'
  root 'calculator#calculator'
end
