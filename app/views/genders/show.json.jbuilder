json.gender do
    json.id @gender.id
    json.name @gender.name
    json.image @gender.image
    json.created_at @gender.created_at.to_time.to_i
    json.updated_at @gender.updated_at.to_time.to_i
end
