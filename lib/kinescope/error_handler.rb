# frozen_string_literal: true

module Kinescope
  module ErrorHandler

    def self.included(base)
      base.send(:resources) do
        default_handler do |response|
          case response.status
          when 200..299
            next
          when 400
            raise Kinescope::BadRequestError.new("#{response.status}: #{response.body}")
          when 401
            raise Kinescope::UnauthorizedError.new("#{response.status}: #{response.body}")
          when 402
            raise Kinescope::PaymentRequired.new("#{response.status}: #{response.body}")
          when 403
            raise Kinescope::AccessDeniedError.new("#{response.status}: #{response.body}")
          when 404
            raise Kinescope::NotFoundError.new("#{response.status}: #{response.body}")
          else
            raise Kinescope::Error.new("#{response.status}: #{response.body}")
          end
        end
      end
    end

  end
end