class Character < ApplicationRecord
  # model association
  has_and_belongs_to_many :movies

  # validations
  validates_presence_of :name, :age, :weight, :history, :image

  def save_movies(movies)
    movies.each do |movie_id|
      movie = Movie.find(movie_id)
      CharactersMovies.create!(character: self, movie: movie)
    end
  end

  def self.filter_characters_by_characteristics(query_params)
    query = "true "

    if query_params[:name]
      query = query + "AND name = '#{query_params[:name]}' "
    end

    if query_params[:age]
      query = query + "AND age = '#{query_params[:age]}' "
    end

    if query_params[:weight]
      query = query + "AND weight = '#{query_params[:weight]}' "
    end

    Character.where(query)
  end

  def self.filter_characters_by_movie(characters, movie_id)
    characters.select { |character|
      movies = character.movies
      founded_movie = movies.select { |movie|
        movie[:id] == movie_id
      }
      !founded_movie.empty?
    }
  end
end
