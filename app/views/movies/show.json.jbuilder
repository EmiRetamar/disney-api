json.movie do
    json.id @movie.id
    json.title @movie.title
    json.creation_date @movie.creation_date
    json.rating @movie.rating
    json.image @movie.image
    json.characters @movie.characters do | character |
        json.partial! 'characters/character', character: character
    end
    json.gender @movie.gender
    json.created_at @movie.created_at.to_time.to_i
    json.updated_at @movie.updated_at.to_time.to_i
end
