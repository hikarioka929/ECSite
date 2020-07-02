class CartItemsController < ApplicationController
    before_action :authenticate_end_user!

    def index
        @cart_items = CartItem.all
    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path
    end

    def destroy_all
        @cart_items = CartItem.all
        @cart_items.destroy_all
        redirect_to cart_items_path
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        if current_end_user.cart_items.exists?(item_id: @cart_item.item_id)
            @add_item = current_end_user.cart_items.find_by(item_id: @cart_item.item_id)
            @add_item.amount += @cart_item.amount
            @add_item.update(amount: @add_item.amount)
        else
            @cart_item.save
        end
        redirect_to cart_items_path
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id,:end_user_id)
    end
end
