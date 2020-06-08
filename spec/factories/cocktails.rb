FactoryBot.define do
    factory :cocktail do
        name {'テストネーム'}
        base_alcohol {'テストアルコール'}
        taste {'テストテイスト'}
        alcohol_percentage {15}
        glass_type {'テストグラス'}
    end
end