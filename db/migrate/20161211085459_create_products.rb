class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :brand
	  t.string :name
	  t.float  :price
	  t.string :size
	  t.string :category
	  t.string :image_link
	  t.integer :product_quantity
	  t.belongs_to :cart, index: true
      t.timestamps null: false
    end
  end
end

