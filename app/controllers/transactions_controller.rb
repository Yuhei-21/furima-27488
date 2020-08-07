class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:postcode,:prefecturecode,:city, :housenumber, :buildingname, :phonenumber, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_2a18ff99eca591c3ba2fcca3"
    Payjp::Charge.create(
      amount: @transaction.item.price,
      card: params.require(:payjpToken),
      currency:'jpy'
      
    )
  end
end
