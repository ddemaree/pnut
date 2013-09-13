Pnut::Application.routes.draw do

  namespace :admin do
    resource :session
    get "/login" => "sessions#new", as: :login

    resources :destinations
    get "/" => redirect("/admin/destinations")
  end

  # Default base36 style URLs (similar to t.co)
  get "/x/:id+" => "destinations#show"
  get "/x/:id" => "destinations#resolve"

  get "(/:namespace)/:slug+" => "destinations#show"
  get "(/:namespace)/:slug" => "destinations#resolve"
  # TODO: Really we should canonicalize to one or the other

end
