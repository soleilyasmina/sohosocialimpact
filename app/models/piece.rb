class Piece < ApplicationRecord
  belongs_to :artist
  has_many_attached :photos
end
