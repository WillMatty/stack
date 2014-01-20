# This file should contain all the record creation needed to seed the database 
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the 
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Story.create(
	title: 'Reddit', 
	description: 'The front page of the Internet', 
	url: 'http://www.reddit.com'
	)

Story.create(
	title: 'Wordeo',
	description: 'The video messaging app that brings words to life', 
	url: 'http://www.wordeo.com'
	)
