class Review < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :content, :rating # , :restaurant
  validates :rating, inclusion: { in: (0..5).to_a }, numericality: true
end
