# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cocktail.create!(name: "ウイスキー", base_alcohol: "ウイスキー", taste: "辛い", alcohol_percentage: 40, glass_type:"ロング",cocktail_recipe: "ウイスキー原液")
Cocktail.create!(name: "ラム", base_alcohol: "ラム", taste: "辛い", alcohol_percentage: 40, glass_type:"ロング",cocktail_recipe: "ラム原液")
Cocktail.create!(name: "ウォッカ ", base_alcohol: "ウォッカ", taste: "辛い", alcohol_percentage: 40, glass_type:"ロング",cocktail_recipe: "ウォッカ原液")
Cocktail.create!(name: "ジン", base_alcohol: "ジン", taste: "辛い", alcohol_percentage: 40, glass_type:"ロング",cocktail_recipe: "ジン原液")
5.times do |n|
    Cocktail.create!(
      name: "ウイスキーロック",
      base_alcohol: "ウイスキー",
      taste: "辛い",
      alcohol_percentage: n * 10,
      glass_type:"ロング",
      cocktail_recipe: "ウイスキー原液"
    )
  end