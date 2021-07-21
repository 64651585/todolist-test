class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.create todo_params
        redirect_to todo_path(@todo)
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update todo_params
        redirect_to todo_path(@todo)
    end

    def destroy
        Todo.find(params[:id]).destroy
        redirect_to root_path
    end

    def done
        
    end

    def complete
        @todo.update_attribute(:completed_at, Time.now)
        redirect_to todo_path(@todo), notice: 'Mensagem enviada com sucesso!'
    end

    def clickedon
    end

    def clickedoff
    end

    private
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
