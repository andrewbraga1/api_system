Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :laboratories do 
        post 'exams/:exam_id', to: 'laboratories#associate_exam', as: :associate_exam
        delete 'exams/:exam_id', to: 'laboratories#unassociate_exam', as: :unassociate_exam
      end
      resources :exams
    end
  end
end
