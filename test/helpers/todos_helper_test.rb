require "test_helper"

class TodosHelperTest < ActionView::TestCase
  test "priority_label returns correct Thai label" do
    todo = Todo.new(priority_level: :important_urgent)
    assert_equal "สำคัญและเร่งด่วน", priority_label(todo)

    todo.priority_level = :not_important_not_urgent
    assert_equal "ไม่สำคัญและไม่เร่งด่วน", priority_label(todo)

    todo.priority_level = :important_not_urgent
    assert_equal "สำคัญแต่ไม่เร่งด่วน", priority_label(todo)

    todo.priority_level = :not_important_urgent
    assert_equal "ไม่สำคัญแต่เร่งด่วน", priority_label(todo)
  end

  test "priority_label falls back to default" do
    todo = Todo.new(priority_level: nil)
    assert_equal "ไม่สำคัญและไม่เร่งด่วน", priority_label(todo)
  end

  test "priority_badge_class returns correct css class" do
    todo = Todo.new(priority_level: :important_not_urgent)
    assert_equal "bg-yellow-400 text-gray-800", priority_badge_class(todo)

    todo.priority_level = :not_important_urgent
    assert_equal "bg-blue-500 text-white", priority_badge_class(todo)

    todo.priority_level = :important_urgent
    assert_equal "bg-red-500 text-white", priority_badge_class(todo)
  end

  test "priority_badge_class falls back to default" do
    todo = Todo.new(priority_level: nil)
    assert_equal "bg-gray-300 text-gray-800", priority_badge_class(todo)
  end

  test "priority_options_for_select returns all options" do
    options = priority_options_for_select

    assert_includes options, [ "สำคัญและเร่งด่วน", "important_urgent" ]
    assert_includes options, [ "ไม่สำคัญและไม่เร่งด่วน", "not_important_not_urgent" ]
    assert_includes options, [ "สำคัญแต่ไม่เร่งด่วน", "important_not_urgent" ]
    assert_includes options, [ "ไม่สำคัญแต่เร่งด่วน", "not_important_urgent" ]
  end
end
