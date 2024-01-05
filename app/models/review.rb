class Review < ApplicationRecord
    validates :name, :rating, :description, :location, :image, presence: true
    belongs_to :user
end
