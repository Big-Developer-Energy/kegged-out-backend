class Review < ApplicationRecord
    validates :name, :rating, :description, :location, :image, presence: true
end
