FactoryBot.define do
    factory :cocktail do
        name {'テストネーム'}
        base_alcohol {'テストアルコール'}
        taste {'テストテイスト'}
        alcohol_percentage {'テストパーセント'}
        glass_type {'テストグラス'}
    end
end