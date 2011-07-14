Massfinder::Application.routes.draw do

  resources :parishes do
    resources :masses
  end
  
  # match 'parishes/:id/getlatlong' => 'parishes#getlatlong', :as => :getlatlong  
  root :to => "index#index"
end
