class Admin::OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details

    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        if @order.order_status == 1
            @order_details = @order.order_details
            @order_details.update_all(product_status: 1)
        end
        redirect_to admin_order_path(@order)
    end

    private

    def order_params
        params.require(:order).permit(:order_status)
    end

    def order_detail_params
        params.require(:order_detail).permit(:product_status)
    end
end
