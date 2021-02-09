# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    name: "cake",
    is_active: true
)

Item.create!(
    genre_id: 1,
    name: "モンブラン",
    introduction: "sweet",
    price: 600,
    is_sale: true
)

Item.create!(
    genre_id: 1,
    name: "バナナケーキ",
    introduction: "sweet",
    price: 500,
    is_sale: true
)