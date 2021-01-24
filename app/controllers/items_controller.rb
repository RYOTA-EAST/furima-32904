class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :create]

  def index
    @item = Item.all.includes(:user).order(id: 'DESC')
  end

  def new
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

  def move_to_login
    authenticate_user!
  end
end
