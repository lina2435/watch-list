class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]
 # Un usuario puede añadir un nuevo marcador (película / lista de pares) a una lista existente
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
  # _path : , si declaro mis recursos de routes.rbesta manera
  # resources :posts --tendría los siguientes caminos disponibles
  # posts_path -post_path  -new_post_path -edit_post_path
  # Si usa algo extraño abc_pathque no ha sido declarado routes.rb, obtendrá errores.
end
