require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create!(title: "Sample todo")
  end

  test "should get index" do
    get todos_url
    assert_response :success
    assert_select "h1", "Todos"
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { title: "New todo" } }
    end
    assert_redirected_to todos_url
  end

  test "should not create todo without title" do
    assert_no_difference("Todo.count") do
      post todos_url, params: { todo: { title: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should toggle todo" do
    assert_not @todo.is_done
    patch toggle_todo_url(@todo), as: :turbo_stream
    assert_response :success
    @todo.reload
    assert @todo.is_done
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end
    assert_redirected_to todos_url
  end
end
