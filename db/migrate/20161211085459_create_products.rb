class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :brand
	  t.string :name
	  t.float  :price
	  t.string :size
	  t.string :color
	  t.references :order, index:true, foreign_key:true
	  t.references :cart, index:true, foreign_key:true
	  t.references :category, index:true, foreign_key:true
      t.timestamps null: false
    end
  end
end

