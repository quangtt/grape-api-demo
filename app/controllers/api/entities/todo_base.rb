module API
  module Entities
    class TodoBase < Grape::Entity
      format_with(:ymd) do |date|
        date.strftime('%Y-%m-%d %H:%M:%S')
      end
      expose :id
      expose :title
      with_options(format_with: :ymd) do
        expose :created_at
        expose :updated_at
      end
      # expose :created_at do |todo|
      #   todo.created_at.strftime('%Y-%m-%d %H:%M:%S')
      # end
    end
  end
end
