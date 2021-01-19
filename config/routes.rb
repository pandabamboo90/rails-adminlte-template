Rails.application.routes.draw do
  get "home/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins,
    path: "/",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      edit: "password"
    }

  root "home#index"
end
