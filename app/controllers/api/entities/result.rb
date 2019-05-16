module API
  module Entities
    class Result < Grape::Entity
      expose :status do |result|
        result[:status]
      end
      expose :data, if: ->(result, *) { result[:data].present? } do |result|
        result[:data]
      end
    end
  end
end
