class Artist < ApplicationRecord
  has_secure_password
  has_many :pieces
  has_one_attached :avatar
end
