class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :password_digest
      t.string :auth_token

      t.timestamps null: false
    end
    add_index :users, :email
  end
end