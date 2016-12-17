class CreateJoinTableProductCustomer < ActiveRecord::Migration
  def change
    create_join_table :products, :customers do |t|
      t.belongs_to :product, index: true
      t.belongs_to :customer, index: true
    end
  end
end
