class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # en index siempre va la var de instancia plural
  # bookmark = marcador
  def index
    @lists = List.all
  end

  # Un usuario puede ver los detalles de
  # una lista determinada y su nombre
  def show
    @bookmark = Bookmark.new
  end
  # Un usuario puede crear una nueva lista
  def new
    @list = List.new
  end
  # post
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
