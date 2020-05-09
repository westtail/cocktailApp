class Cocktail < ApplicationRecord
    validates :name, presence: true
    validates :base_alcohol, presence: true
    validates :taste, presence: true
    validates :alcohol_percentage, presence: true
    validates :glass_type, presence: true
end
