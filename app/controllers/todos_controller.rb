class TodosController < ApplicationController
  def index
    @todos = Todo.order(Arel.sql("due_on IS NULL, due_on ASC"))
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "Todo created successfully!"
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todo updated!"
    else
      render :edit
    end
  end
  def toggle
    @todo = Todo.find(params[:id])
    @todo.update(is_done: !@todo.is_done)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todos_path }
    end
  end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: "Todo deleted!"
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :notes, :is_done, :priority_level, :due_on, :due_time, :position)
  end
end
