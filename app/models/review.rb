class Review < ApplicationRecord
    validates :name, :rating, :description, :location, :image, :user_id, presence: true
    belongs_to :user
end
