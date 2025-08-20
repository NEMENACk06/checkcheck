class RemoveCategoryIdFromTodos < ActiveRecord::Migration[7.1]
  def change
    remove_column :todos, :category_id, :bigint
  end
end
