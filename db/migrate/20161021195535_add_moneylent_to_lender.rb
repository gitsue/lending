class AddMoneylentToLender < ActiveRecord::Migration
  def change
    add_column :lenders, :moneylent, :string
  end
end
