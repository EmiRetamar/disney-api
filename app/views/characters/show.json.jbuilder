json.character do
    json.id @character.id
    json.name @character.name
    json.age @character.age
    json.weight @character.weight
    json.history @character.history
    json.image @character.image
    json.movies @character.movies do | movie |
        json.partial! 'movies/movie', movie: movie
    end
    json.created_at @character.created_at.to_time.to_i
    json.updated_at @character.updated_at.to_time.to_i
end
