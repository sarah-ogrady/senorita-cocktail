require 'open-uri'

puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

celery_juice = Ingredient.create(name: "celery juice")
puts "Finish Ingredients"

puts "Create Cocktails"
bloody_mary = Cocktail.create(name: "Bloody Mary")
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Dark and Stormy")
Cocktail.create(name: "Vodka Lime")
Cocktail.create(name: "Cherry Red")
Cocktail.create(name: "Strawberry Daquiri")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Negroni")
Cocktail.create(name: "Aperol Spritz")
puts "finish cocktails"

puts "Create Doses"
# dose_uno = Dose.create(cocktail_id: bloody_mary.id, ingredient_id: celery_juice.id, description: "blah blah" )
# puts dose_uno


Cocktail.all.each do |cocktail|
  Ingredient.all.sample(4).each do |ingredient|
    puts Dose.create!(cocktail_id: cocktail.id, ingredient_id: ingredient.id, description: "30ml" )
  end
end

puts "finish doses"
