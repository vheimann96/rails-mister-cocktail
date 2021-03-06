# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'

user = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

user['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

puts 'Finished!'

# API aufrufen
  # @cocktail
  # search = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita").read)
  # url = search['drinks'][0]['strDrinkThumb']
  # return url.class

# neue migration machen (für cocktail als field image url)
# müsste den link runterladen
# da wo die kate
