class ItemsController < ApplicationController
  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :state_id, :ship_pay_id, :prefecture_id, :ship_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
