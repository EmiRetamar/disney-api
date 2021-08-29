# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gender.delete_all
Movie.delete_all
Character.delete_all

projects = Character.create!([{name: 'Mickey Mouse', age: '100', weight: 40, history: 'Mickey Mouse es un personaje ficticio de la serie del mismo nombre, emblema de la compañía Disney', image: 'Link 1'},  {name: 'Donald Duck', age: '80', weight: 50, history: 'El Pato Donald​ es un personaje de Disney, caracterizado como un pato blanco antropomórfico de ojos celestes, pico, piernas y pies anaranjados', image: 'Link 2'}, {name: 'Goofy', age: '90', weight: 70, history: 'Goofy es un personaje de ficción creado por Walt Disney', image: 'Link 3'}])

# projects.each do |project|
#     Milestone.create!(title: 'Set up dependencies',  done: false, project: project)
# end
