class User < ApplicationRecord
  belongs_to :address
  has_secure_password
end
