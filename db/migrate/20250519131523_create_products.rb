class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :stock
      t.references :created_by, null: false, foreign_key: { to_table: :admin_users }

      t.timestamps
    end
  end
end
