class CreateJoinTableProductOrder < ActiveRecord::Migration
  def change
    create_join_table :products, :orders do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true
    end
  end
end
