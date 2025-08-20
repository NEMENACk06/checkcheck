class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.references :category, null: false, foreign_key: true, index: true
      t.string  :title,          null: false
      t.text    :notes
      t.boolean :is_done,        null: false, default: false
      t.integer :priority_level, null: false, default: 0
      t.date    :due_on
      t.time    :due_time
      t.integer :position,       null: false, default: 0
      t.timestamps
    end
    add_index :todos, [:category_id, :position], name: "index_todos_on_category_id_and_position"
    add_index :todos, :is_done,                  name: "index_todos_on_is_done"
    add_index :todos, :priority_level,           name: "index_todos_on_priority_level"
  end
end