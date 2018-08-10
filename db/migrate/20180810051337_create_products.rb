class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :item_type
      t.string :description
      t.string :condition
      t.string :title
      t.string :image
      t.string :user_id
      t.string :size
      t.string :gender
      t.string :color
      t.decimal :price, precision: 5, scale: 2, default: 0 
      t.timestamps
    end
  end
end
