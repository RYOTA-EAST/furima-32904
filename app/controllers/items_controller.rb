class ItemsController < ApplicationController
  
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item.save(item_params)
  end

  private
  def item_params
    params.requier(:message).pirmit(:name, :description, :category_id, :state_id, :ship_pay_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id:current_user.id)
  end
end
