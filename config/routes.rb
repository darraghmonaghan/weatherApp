Rails.application.routes.draw do
  
root to: 'searches#index'

  get 'searches/index', to: 'searches#index'

  post 'searches/forecast', to: 'searches#forecast'

  get 'searches/detail', to: 'searches#detail'


end
