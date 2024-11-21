class Book < ApplicationRecord
  has_many :reviews
  belongs_to :category
end
