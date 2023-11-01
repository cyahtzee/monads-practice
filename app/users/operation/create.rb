# frozen_string_literal: true

module Users::Operation
  class Create < BaseOperation
    include Dry::Monads[:result, :do]

    def call(params)
      user = user.new(params)

      if user.save
        Success(user.update(address_id: params[:address_id]))
      else
        Failure(user.errors.to_h)
      end
    end
  end
end
