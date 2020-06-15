class ItemsController < ApplicationController
    def top
    end

    def index
        @items = Item.where(is_sale: true)
    end
end