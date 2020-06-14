# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.create!(name: "ジントニック", base_alcohol: "ジン", taste: "普通", alcohol_percentage: 15, glass_type:"ロング",cocktail_recipe: "コップに氷とジンを入れてステア。トニックウォーターをを混ぜて完成")
Cocktail.create!(name: "ジンバック", base_alcohol: "ジン", taste: "普通", alcohol_percentage: 15, glass_type:"ロング",cocktail_recipe: "コップに氷とジン、ライムジュースを入れる。ジンジャーエールを混ぜて完成")
Cocktail.create!(name: "モスコミュール", base_alcohol: "ウォッカ", taste: "普通", alcohol_percentage: 10, glass_type:"ロング",cocktail_recipe: "コップに氷とウォッカとライムジュース、ジンジャーエールを混ぜて完成")
Cocktail.create!(name: "モヒート", base_alcohol: "ラム", taste: "普通", alcohol_percentage: 20, glass_type:"ロング",cocktail_recipe: "コップに砕いた氷とラム、ミント、ライム、砂糖を入れて。ソーダーを入れてよく混ぜて完成")
Cocktail.create!(name: "テキーラサンライズ", base_alcohol: "テキーラ", taste: "甘い", alcohol_percentage: 12, glass_type:"ロング",cocktail_recipe: "グラスに氷、テキーラ、オレンジジュースを入れてステア、グレナデシロップを沈めて完成")
Cocktail.create!(name: "ウイスキーショット", base_alcohol: "ウイスキー", taste: "辛い", alcohol_percentage: 40, glass_type:"ショット",cocktail_recipe: "ウイスキーをグラスに入れて完成")
Cocktail.create!(name: "ラムショット", base_alcohol: "ラム", taste: "辛い", alcohol_percentage: 40, glass_type:"ショット",cocktail_recipe: "ラムをグラスに入れて完成")
Cocktail.create!(name: "ウォッカショット", base_alcohol: "ウォッカ", taste: "辛い", alcohol_percentage: 40, glass_type:"ショット",cocktail_recipe: "ウォッカをグラスに入れて完成")
Cocktail.create!(name: "ジンショット", base_alcohol: "ジン", taste: "辛い", alcohol_percentage: 40, glass_type:"ショット",cocktail_recipe: "ジンをグラスに入れて完成")
Cocktail.create!(name: "テキーラショット", base_alcohol: "テキーラ", taste: "辛い", alcohol_percentage: 40, glass_type:"ショット",cocktail_recipe: "テキーラをグラスに入れて完成")
#5.times do |n|
#    Cocktail.create!(
#      name: "ウイスキーロック",
#      base_alcohol: "ウイスキー",
#      taste: "辛い",
#      alcohol_percentage: n * 10,
#      glass_type:"ロング",
#      cocktail_recipe: "ウイスキー原液"
#    )
#  end