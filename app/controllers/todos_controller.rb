class TodosController < ApplicationController
  def index
    @todos = Todo.order(created_at: :desc)
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
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to todos_path }
      end
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @todo = Todo.find(params[:id])
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
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todos_path }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :notes, :is_done, :priority_level, :due_on, :due_time, :position)
  end
end
