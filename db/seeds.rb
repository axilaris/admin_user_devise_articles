# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



article_list = [
				["aaaaa", 1, "Admin"],
				["bbbbb", 1, "User"],
				["ccccc", 2, "Admin"],
				["ddddd", 1, "User"],
				["eeeee", 2, "Admin"],
				["fffff", 2, "Admin"],
				["ggggg", 1, "Admin"]											
			]

article_list.each do |post, person_id, person_type|
	Article.create(post: post, person_id: person_id, person_type: person_type)
end

