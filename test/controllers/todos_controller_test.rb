require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create!(title: "Sample todo")
  end

  test "should get index" do
    get todos_path
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_path, params: { todo: { title: "New todo" } }
    end
    assert_redirected_to todos_path
  end

  test "should not create todo without title" do
    assert_no_difference("Todo.count") do
      post todos_path, params: { todo: { title: "" } }
    end
    assert_response :unprocessable_content
  end

  test "should toggle todo" do
    assert_not @todo.is_done
    patch toggle_todo_path(@todo), as: :turbo_stream
    assert_response :success
    @todo.reload
    assert @todo.is_done
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_path(@todo)
    end
    assert_redirected_to todos_path
  end
end
