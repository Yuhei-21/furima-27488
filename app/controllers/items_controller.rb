class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def show
  end


  def update
    if @item.valid?
      @item.update(item_params)
      redirect_to @item
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:item_explanation, :price, :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end