class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true, index: false
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.boolean :is_sale

      t.timestamps
    end
  end
end
