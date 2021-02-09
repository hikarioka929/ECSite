class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_details
    enum peyment: {credit_card:0, bank:1}
    validates :post_code, presence: true
    validates :address, presence: true
    validates :name, presence: true
    validates :peyment, presence: true

    def item_count
        sum = 0
        self.order_details.each do |order_detail|
            sum += order_detail.amount
        end
        return sum
    end

    def total_fee
        sum = 0
        self.order_details.each do |order_detail|
            sum += (order_detail.price * 1.08).round * order_detail.amount
        end
        return sum
    end
end
