class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @category = Category.all
    @condition = Condition.all
    @postagepayer = Postagepayer.all
    @postagetype = Postagetype.all
    @preparationday = Preparationday.all
  end

  def create
    @item = Item.create(item_params)
    redirect_to @item
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id]) 
  end

  def update
    @item = Item.find(params[:id])
    @item.update params.require(:item).permit(item_params)
    redirect_to @item
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:item_explanation, :price, :category_id, :condition_id, :preparationday_id, :postagetype_id, :postagepayer_id).merge(user_id: current_user.id)
  end
end