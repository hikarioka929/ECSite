class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
  end
  belongs_to :genre
  has_many :cart_items
  attachment :image
end
