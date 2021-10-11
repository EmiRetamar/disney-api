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

  def self.filter_movies_by_characteristics(query_params)
    query = "true "

    if query_params[:title]
      query = query + "AND title = '#{query_params[:title]}' "
    end

    if query_params[:genre]
      query = query + "AND gender_id = '#{query_params[:genre]}' "
    end

    Movie.where(query)
  end

  def self.filter_movies_by_gender(movies, genre_id)
    movies.select { |movie|
      gender = movie.gender
      gender[:id] == genre_id
    }
  end

  def self.order_by_creation_date(order)
    self.order(created_at: order)
  end
end
