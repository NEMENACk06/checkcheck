class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string  :name,     null: false
      t.integer :position, null: false, default: 0
      t.timestamps
    end
    add_index :categories, :name,     name: "index_categories_on_name"
    add_index :categories, :position, name: "index_categories_on_position"
  end
end
