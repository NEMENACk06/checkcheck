# spec/system/todos_spec.rb
require "rails_helper"

RSpec.describe "Todos Page", type: :feature, js: true do
  before do
    page.driver.browser.manage.window.resize_to(1400, 900)
  end

  let!(:existing_todo) { Todo.create!(title: "Read a book", priority_level: :important_not_urgent) }

  it "visits the index and sees header + list" do
    visit todos_path

    expect(page).to have_selector(%([data-testid="list-todos-section"]))
    expect(page).to have_selector(%([data-testid="list-todos-title"]), text: "Todos")
    expect(page).to have_selector(%([data-testid="todos-list"]))
    expect(page).to have_selector('li[data-testid="todo-item"]')
  end

  it "creates a new todo from the form" do
    visit todos_path

    title = "Buy milk"

    find(%([data-testid="todo-title-field"])).fill_in with: title
    find(%([data-testid="todo-due-date"])).fill_in with: Date.today.to_s
    select_id = find(%([data-testid="todo-priority-select"])).native["id"]
    select "สำคัญและเร่งด่วน", from: select_id

    find(%([data-testid="todo-submit-btn"])).click
    expect(page).to have_selector('li[data-testid="todo-item"]')
  end

  it "deletes a todo from the list" do
    visit todos_path

first_item = first('li[data-testid="todo-item"]')
    first_title = first_item.find(%([data-testid="todo-title"])).text.strip

    accept_confirm do
      first_item.find(%([data-testid="todo-delete-btn"])).click
    end

    expect(page).to have_no_text(first_title, wait: 5)
  end
end
