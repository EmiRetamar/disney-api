class Movie < ApplicationRecord
  # model association
  has_and_belongs_to_many :characters
  belongs_to :gender

  # validations
  validates_presence_of :title, :creation_date, :rating, :image

  def save_characters(characters)
    characters.each do |character_id|
      character = Character.find(character_id)
      CharactersMovies.create!(movie: self, character: character)
    end
  end
end
