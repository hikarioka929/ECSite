class Admin::OrderDetailsController < ApplicationController

    def update
        @order_detail = OrderDetail.find(params[:id])
        @order_detail.update(product_status: params[:order_detail][:product_status])
        #紐づく注文商品の製作ステータスが1つでも"製作中"になったら、注文ステータスを"製作中"に更新
        if @order_detail.product_status == 2
            @order_detail.order.update(order_status: 2)
        end
        #紐づく注文商品全ての製作ステータスが"製作完了"になったら、注文ステータスを"発送準備中"に更新
            #全ての製作ステータスが’製作完了’になったかどうか調べる
            is_true = false
            @order_detail.order.order_details.each do |order_detail|
                if order_detail.product_status == 3
                    is_true = true
                else
                    is_true = false
                    break
                end
            end
            if is_true == true
                @order_detail.order.update(order_status: 3)
            end
        redirect_to request.referer
    end
end
