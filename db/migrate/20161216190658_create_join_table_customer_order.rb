class CreateJoinTableCustomerOrder < ActiveRecord::Migration
  def change
    create_join_table :customers, :orders do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :order, index: true
    end
  end
end
