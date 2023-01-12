class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy update]
  def index
    @lists = List.all
  end


  def show

  end

  def update
    @list.update(list_params)
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save!
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
