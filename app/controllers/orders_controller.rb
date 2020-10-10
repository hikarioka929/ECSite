class OrdersController < ApplicationController
    before_action :authenticate_end_user!

    def new
        @end_user = current_end_user
    end
    
    def confirm
        #表示させたい内容
        #1.支払い方法
        #2.お届け先
        #3.カートに入れた商品の情報
        @end_user = current_end_user
        @order = Order.new
        @order.peyment = params[:peyment]
        if params[:address_option] == "0"
            @order.post_code = current_end_user.post_code
            @order.address = current_end_user.address
            @order.name = current_end_user.last_name + current_end_user.first_name
        elsif params[:address_option] == "1"
            @address = Address.find(params[:address])
            @order.post_code = @address.post_code
            @order.address = @address.address
            @order.name = @address.name
        elsif params[:address_option] == "2"
            @order.post_code = params[:post_code]
            @order.address = params[:address]
            @order.name = params[:name]
        end
        @cart_items = @end_user.cart_items
    end

    def done
    end

    def create
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.order_status = 0
        @order.save
        current_end_user.cart_items.each do |cart_item|
            order_detail = OrderDetail.new
            order_detail.item_id = cart_item.item.id
            order_detail.order_id = @order.id
            order_detail.amount = cart_item.amount
            order_detail.price = cart_item.item.price
            order_detail.save
        end
        current_end_user.cart_items.destroy_all
        redirect_to done_orders_path
    end

    private

    def order_params
        params.require(:order).permit(:peyment,:post_code,:address,:name,:postage,:total_price)
    end
end
