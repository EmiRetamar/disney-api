class Movie < ApplicationRecord
  # model association
  has_and_belongs_to_many :characters
  belongs_to :gender

  # validations
  validates_presence_of :title, :creation_date, :rating, :image
end
