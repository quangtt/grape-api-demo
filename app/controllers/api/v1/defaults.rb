module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix 'api'
        version 'v1', using: :path
        default_format :json
        format :json

        helpers do
          def permitted_params
            @permitted_params ||= declared(params,
              include_missing: false)
          end

          def logger
            Rails.logger
          end

          def result message = 'OK', code = '000', data = nil
            API::Entities::Result.represent(
              status: {code: code, message: message},
              data: data.as_json
            ).as_json
          end

          def error_custom message, code = 333
            error!({status: {code: code, message: message}}, 400)
          end
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_custom(e.message, 999)
        end
      end
    end
  end
end
