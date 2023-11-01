# frozen_string_literal: true

module WithResponse
  extend ActiveSupport::Concern

  def handle_response(result, serializer)
    result.success? ? render(json: serializer.new(result.value!)) : render(json: result.failure, status: :unprocessable_entity)
  end
end
