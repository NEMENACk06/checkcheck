require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Todos"
  end

  test "should create todo" do
    visit todos_url
    click_on "New todo"

    fill_in "Category", with: @todo.category_id
    fill_in "Due on", with: @todo.due_on
    fill_in "Due time", with: @todo.due_time
    check "Is done" if @todo.is_done
    fill_in "Notes", with: @todo.notes
    fill_in "Position", with: @todo.position
    fill_in "Priority level", with: @todo.priority_level
    fill_in "Title", with: @todo.title
    click_on "Create Todo"

    assert_text "Todo was successfully created"
    click_on "Back"
  end

  test "should update Todo" do
    visit todo_url(@todo)
    click_on "Edit this todo", match: :first

    fill_in "Category", with: @todo.category_id
    fill_in "Due on", with: @todo.due_on
    fill_in "Due time", with: @todo.due_time.to_s
    check "Is done" if @todo.is_done
    fill_in "Notes", with: @todo.notes
    fill_in "Position", with: @todo.position
    fill_in "Priority level", with: @todo.priority_level
    fill_in "Title", with: @todo.title
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
    click_on "Back"
  end

  test "should destroy Todo" do
    visit todo_url(@todo)
    click_on "Destroy this todo", match: :first

    assert_text "Todo was successfully destroyed"
  end
end
