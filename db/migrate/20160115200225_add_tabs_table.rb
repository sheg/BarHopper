class AddTabsTable < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.integer :user_id
      t.integer :bar_id
      t.float :balance, null: false, default: 0.0
    end
    add_index :tabs, :user_id
    add_index :tabs, :bar_id
  end
end