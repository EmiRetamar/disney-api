json.array! @movies do |movie|
    json.id movie.id
    json.title movie.title
    json.creation_date movie.creation_date
	json.image movie.image
end
