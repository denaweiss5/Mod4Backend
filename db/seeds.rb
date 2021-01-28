# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Note.destroy_all

dena = User.create(username: "dena", password: "dena")
gidon = User.create(username: "gidon", password: 'gidon')

note1 = Note.create(title: "Groceries", content: "I need to buy apples, grapes, bread, onions, noodles, etc", user_id: dena.id)
note2 = Note.create(title: "Clean", content: "I need to sweep, mop, clean dishes", user_id: gidon.id)