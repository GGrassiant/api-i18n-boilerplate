puts 'let\'s create some seeds!'
puts 'cleaning db'

Item.destroy_all

puts 'creating items'

item1 = Item.create!(
  name: 'Item 1',
  description: 'Description for item 1',
  locale: 'en'
)

item1.attributes = {
  name: 'Élément 1',
  description: 'Description pour l\'élément 1',
  locale: 'fr'
}

item1.attributes = {
  name: 'البند 1',
  description: 'وصف البند 1',
  locale: 'ar'
}

item1.save!

item2 = Item.create!(
  name: 'Item 2',
  description: 'Description for item 2',
  locale: 'en'
)

item2.attributes = {
  name: 'Élément 2',
  description: 'Description pour l\'élément 2',
  locale: 'fr'
}

item2.attributes = {
  name: 'البند 2',
  description: 'وصف البند 2',
  locale: 'ar'
}

item2.save!

item3 = Item.create!(
  name: 'Item 3',
  description: 'Description for item 3',
  locale: 'en'
)

item3.attributes = {
  name: 'Élément 3',
  description: 'Description pour l\'élément 3',
  locale: 'fr'
}

item3.attributes = {
  name: 'البند 3',
  description: 'وصف البند 3',
  locale: 'ar'
}

item3.save!

item4 = Item.create!(
  name: 'Item 4',
  description: 'Description for item 4',
  locale: 'en'
)

item4.attributes = {
  name: 'Élément 4',
  description: 'Description pour l\'élément 4',
  locale: 'fr'
}

item4.attributes = {
  name: 'البند 4',
  description: 'وصف البند 4',
  locale: 'ar'
}

item4.save!

puts 'done baby!'
