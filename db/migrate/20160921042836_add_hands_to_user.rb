class AddHandsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hands, :integer, :default => 10
  end
end
