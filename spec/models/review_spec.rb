require 'rails_helper'

RSpec.describe Review, type: :model do

    it "should validate name" do
      review = Review.create(rating: 3, description: 'Average', location: 'San Marcos', image: 'image', user_id: 1)
      expect(review.errors[:name]).to_not be_empty
    end

    it "should validate rating" do
      review = Review.create(name: 'Stella', description: 'Average', location: 'San Marcos', image: 'image', user_id: 1)
      expect(review.errors[:rating]).to_not be_empty
    end

    it "should validate description" do
      review = Review.create(name: 'Stella', rating: 3, location: 'San Marcos', image: 'image', user_id: 1)
      expect(review.errors[:description]).to_not be_empty
    end

    it "should validate location" do
      review = Review.create(name: 'Stella', rating: 3, description: 'Average', image: 'image', user_id: 1)
      expect(review.errors[:location]).to_not be_empty
    end

    it "should validate image" do
      review = Review.create(name: 'Stella', rating: 3, description: 'Average', location: 'San Marcos', user_id: 1)
      expect(review.errors[:image]).to_not be_empty
    end

    it "should validate user id" do
      review = Review.create(name: 'Stella', rating: 3, description: 'Average', location: 'San Marcos', image: 'image')
      expect(review.errors[:user_id]).to_not be_empty
    end
    
end