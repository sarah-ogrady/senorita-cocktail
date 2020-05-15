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

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
bloody_mary = Cocktail.new(name: "Bloody Mary")
bloody_mary.photo.attach(io: file, filename: 'mary.jpg', content_type: 'image/jpg')
bloody_mary.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
mojito = Cocktail.new(name: "Mojito")
mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')
mojito.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
dark_and_stormy = Cocktail.new(name: "Dark and Stormy")
dark_and_stormy.photo.attach(io: file, filename: 'dark_and_stormy.jpg', content_type: 'image/jpg')
dark_and_stormy.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
vodka_lime = Cocktail.new(name: "Vodka Lime")
vodka_lime.photo.attach(io: file, filename: 'vodka_lime.jpg', content_type: 'image/jpg')
vodka_lime.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
cherry_red = Cocktail.new(name: "Cherry Red")
cherry_red.photo.attach(io: file, filename: 'cherry_red.jpg', content_type: 'image/jpg')
cherry_red.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
strawberry_daquiri = Cocktail.new(name: "Strawberry Daquiri")
strawberry_daquiri.photo.attach(io: file, filename: 'strawberry_daquiri.jpg', content_type: 'image/jpg')
strawberry_daquiri.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
cuba_libre = Cocktail.new(name: "Cuba Libre")
cuba_libre.photo.attach(io: file, filename: 'cuba_libre.jpg', content_type: 'image/jpg')
cuba_libre.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
negroni = Cocktail.new(name: "Negroni")
negroni.photo.attach(io: file, filename: 'negroni.jpg', content_type: 'image/jpg')
negroni.save

file = URI.open('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/12/212.jpg')
aperol_spritz = Cocktail.new(name: "Aperol Spritz")
aperol_spritz.photo.attach(io: file, filename: 'aperol_spritz.jpg', content_type: 'image/jpg')
aperol_spritz.save

puts "Finished cocktails"

puts "Create Doses"
# dose_uno = Dose.create(cocktail_id: bloody_mary.id, ingredient_id: celery_juice.id, description: "blah blah" )
# puts dose_uno


Cocktail.all.each do |cocktail|
  Ingredient.all.sample(4).each do |ingredient|
    puts Dose.create!(cocktail_id: cocktail.id, ingredient_id: ingredient.id, description: "30ml" )
  end
end

puts "finish doses"
