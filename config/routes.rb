Rails.application.routes.draw do
  def mainRoutes
    resources :users do
      resources :todos do 
        resources :todo_items
      end
    end

    resources :todos do 
      resources :todo_items
    end
  end
  
  mainRoutes
  scope '/api' do
    mainRoutes
  end
end
