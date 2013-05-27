Enki::Application.routes.draw do
  get "welcome/index"
  get "welcome/temp"
  root :to => 'welcome#index'

end
