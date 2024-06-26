# config/routes.rb
Rails.application.routes.draw do
  get 'interview/index'
  root 'home#index'
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :question_responses, only: [:edit, :update, :destroy]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/interview', to: 'interview#index'
  get '/interview/show', to: 'interview#show', as: :show_interview
  get '/interview/answer', to: 'interview#answer', as: :answer_question
  post '/interview/process_answer', to: 'interview#process_answer', as: :process_answer
  get 'interview/start_generic', to: 'interview#start_generic', as: :start_generic_interview
  get 'interview/answer_generic', to: 'interview#answer_generic', as: :answer_generic_question
  post 'interview/process_generic_answer', to: 'interview#process_generic_answer', as: :process_generic_answer
  get 'interview/review', to: 'interview#review', as: :review_questions
  
  
  get "up" => "rails/health#show", as: :rails_health_check
end


