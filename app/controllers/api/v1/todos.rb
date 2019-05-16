module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do
        desc 'Return all todos'
        get '' do
          # Without serializer
          Todo.all

          # With simple serializer
          # todos = Todo.all
          # present todos, with: API::Entities::TodoList

          # With structured serializer
          # todos = Todo.all
          # data = {
          #   todos: API::Entities::TodoList.represent(todos)
          # }
          # result('Request completed', 200, data)
        end

        desc 'Return a todo'
        params do
          requires :id, type: String, desc: 'ID of the Todo'
        end
        get ':id' do
          # Without serializer
          Todo.where(id: permitted_params[:id]).first

          # With simple serializer
          # todo = Todo.where(id: permitted_params[:id]).first
          # present todo, with: API::Entities::TodoDetail

          # With structured serializer
          # todo = Todo.where(id: permitted_params[:id]).first
          # error_custom('Todo not found!') if todo.nil?
          # data = {
          #   todos: API::Entities::TodoDetail.represent(todo)
          # }
          # result('Request completed', 200, data)
        end
      end
    end
  end
end
