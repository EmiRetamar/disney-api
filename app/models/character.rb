class Character < ApplicationRecord
  # model association
  has_and_belongs_to_many :movies

  # validations
  validates_presence_of :name, :age, :weight, :history, :image
end
