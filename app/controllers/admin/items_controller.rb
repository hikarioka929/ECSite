class Admin::ItemsController < ApplicationController

    before_action :authenticate_admin!

    def new
        @item = Item.new
    end

    def show
        @item = Item.find(params[:id])
    end


    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_item_path(@item.id)
        else
            render :new
        end
    end

    def index
        @items = Item.search(params[:search])
    end

    private

    def item_params
        params.require(:item).permit(:genre_id,:name,:introduction,:price,:image,:is_sale)
    end
end
