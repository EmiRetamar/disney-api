class Gender < ApplicationRecord
  # model association
  has_many :movies

  # validations
  validates_presence_of :name, :image
end
