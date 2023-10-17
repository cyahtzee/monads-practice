class MessageThread < ApplicationRecord
  belongs_to :post
  belongs_to :message
end
