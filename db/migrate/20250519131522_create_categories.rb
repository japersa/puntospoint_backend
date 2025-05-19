class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :created_by, null: false, foreign_key: { to_table: :admin_users }

      t.timestamps
    end
  end
end
