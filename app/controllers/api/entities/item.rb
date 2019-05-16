module API
  module Entities
    class Item < Grape::Entity
      expose :id
      expose :name
      expose :done
      expose :created_at do |item|
        item.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end
