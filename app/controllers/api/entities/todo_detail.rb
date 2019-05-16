module API
  module Entities
    class TodoDetail < TodoBase
      expose :items do |todo|
        API::Entities::Item.represent(todo.items)
      end
    end
  end
end
