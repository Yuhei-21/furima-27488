class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.order("id DESC")
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
    if @item.valid?
      @item.save!
      redirect_to @item
    else
      render :new
    end
  end

  def show
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

  def set_item
    @item = Item.find(params[:id])
  end
end