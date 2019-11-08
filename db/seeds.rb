require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

request = open(url).read
ingredients = JSON.parse(request).first.flatten.drop(1)

puts 'Creating ingredients...'
ingredients_attributes = []

ingredients.each do |ingredient|
  ingredients_attributes << { name: ingredient["strIngredient1"] }
end

Ingredient.create!(ingredients_attributes)
puts 'Finished!'
