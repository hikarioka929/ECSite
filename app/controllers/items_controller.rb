class ItemsController < ApplicationController
    def top
    end

    def index
        @items = Item.where(is_sale: true)
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
end