### notes to future self

install gem [rack-cors](https://github.com/cyu/rack-cors) for handling cross-origin res

forgery protection in application controller to allow postman post requests (see this [SO](https://stackoverflow.com/questions/41619177/actioncontroller-invalidauthenticitytoken-in-apiv1userscontrollercreate))

strucutre postman post requests like ```{ "user": { "email":"test@test.com, "password":"..." }}``` etc. to pass strong params in rails controller (see [this](https://medium.com/@spaquet/testing-rails-5-api-with-postman-36f1e79dc4d))

this [tutorial](https://medium.com/@pamit/todo-list-building-a-react-app-with-rails-api-7a3027907665) is useful for meshing rails/react via internal api

example api controller:

```ruby
class TodosController < ApplicationController
  def index
    todos = Todo.order("created_at DESC")
    render json: todos
  end

  def create
    todo = Todo.create(todo_param)
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update_attributes(todo_param)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end
  
  private
    def todo_param
      params.require(:todo).permit(:title, :done)
    end
end
```


