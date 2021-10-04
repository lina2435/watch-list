Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  # se pone excep evito las rutas
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:create, :new]
  end
  # va afuera xq no muestra que esta adentro del list DELETE "bookmarks/25"
  resources :bookmarks, only: :destroy

  # Un usuario puede eliminar un marcador de una lista.
  # ¿Cómo podemos volver a hacer un enlace de eliminación?
  # Un usuario puede agregar un nuevo marcador
  # se permite unicamente verbos para crear
  # resources :list, only: [:, :]
  # GET "lists/42/bookmarks/new"
  # aca se observa que el 2 partes list y bookmar te das cuenta que dentro de list debes crear otra ruta para
  # bookmarks
end
