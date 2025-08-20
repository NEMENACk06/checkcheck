json.extract! todo, :id, :category_id, :title, :notes, :is_done, :priority_level, :due_on, :due_time, :position, :created_at, :updated_at
json.url todo_url(todo, format: :json)
