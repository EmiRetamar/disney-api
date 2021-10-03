json.array! @genders do |gender|
    json.id gender.id
    json.name gender.name
    json.image gender.image
    json.movies gender.movies do | movie |
        json.partial! 'movies/movie', movie: movie
    end
end
