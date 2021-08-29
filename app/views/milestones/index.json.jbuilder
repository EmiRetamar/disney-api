# json.array! @milestones do |milestone| 	
#     json.title milestone.title
#     json.done milestone.done
#     json.created_at milestone.created_at.to_time.to_i
# end

json.array! @milestones do |milestone| 	
	json.partial! 'milestones/milestone', milestone: milestone
end
