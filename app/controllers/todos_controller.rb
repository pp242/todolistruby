class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def show
    @todo = Todo.find(params[:id]) 
  end

  def new
    @todo = Todo.new
  end

  def create

    @todo = Todo.create(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to @todo
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
      redirect_to @todo
    else
      render :edit
    end
  end

  def destroy
    Todo.destroy(params[:id])
    redirect_to todos_url
  end

  protected
  def todo_params
    params.require(:todo).permit(:title, :body,:box, :user_id)
  end
end
