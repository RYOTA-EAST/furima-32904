class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    #form_wirh繋がってる
  end

  def new
    #ここにあった.newをindex
  end

  def create
      @item = Item.find(params[:item_id])
      @item_order = ItemOrder.new(order_params)
      if @item_order.valid?
      pay_order
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address, :explosive, :phone_number).merge(user_id: current_user.id, item_id:@item.id, token:params[:token])
  #requireがない
  #idを結合させた
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
