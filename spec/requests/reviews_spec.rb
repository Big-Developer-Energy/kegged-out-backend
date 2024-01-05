require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  
  describe "GET /index" do
    it "gets a list of reviews" do
      Review.create(
        name: 'Sour',
        rating: 4,
        description: 'Sharp, hint of lime',
        location: 'Escondido',
        image: "image"
      )

      get '/reviews'

      review = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(review.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a review" do
      review_params = {
        review: {
          name: 'Sour',
          rating: 4,
          description: 'Sharp, hint of lime',
          location: 'Escondido',
          image: "image"
        }
      }
  
      post '/reviews', params: review_params
  
      expect(response).to have_http_status(200)
  
      review = Review.first
  
      expect(review.name).to eq 'Sour'
    end
  end

  describe "PATCH /update" do
    it "updates a review" do
      review_params = {
        review: {
          name: 'Sour',
          rating: 4,
          description: 'Sharp, hint of lime',
          location: 'Escondido',
          image: "image"
        }
      }
  
      post '/reviews', params: review_params
  
      expect(response).to have_http_status(200)
  
      review = Review.first

      updated_params = {
        review: {
        name: 'Kolsch',
        rating: 4,
        description: 'Sharp, hint of lime',
        location: 'Escondido',
        image: "image"
        }
      }

      patch "/reviews/#{review.id}", params: updated_params

      updated_review = Review.find(review.id)

      expect(response).to have_http_status(200)
  
      expect(updated_review.name).to eq 'Kolsch'
    end
  end

  describe "Delete /destroy" do
    it "deletes a review" do
      review_params = {
        review: {
        name: 'Sour',
        rating: 4,
        description: 'Sharp, hint of lime',
        location: 'Escondido',
        image: "image"
    }
  }
      post '/reviews', params: review_params
      review = Review.first

      delete "/reviews/#{review.id}"

      expect(response).to have_http_status(200)
      review = Review.all
      expect(review).to be_empty
    end
  end

  it "doesn't create a review without a name" do
    review_params = {
      review: {
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)

    expect(json['name']).to include "can't be blank"
  end

  it "doesn't create a review without a rating" do
    review_params = {
      review: {
        name: 'Stella',
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    
    expect(json['rating']).to include "can't be blank"
  end

  it "doesn't create a review without a description" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    
    expect(json['description']).to include "can't be blank"
  end

  it "doesn't create a review without a location" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        image: 'image'
      }
    }

    post '/reviews', params: review_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    
    expect(json['location']).to include "can't be blank"
  end

  it "doesn't create a review without an image" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos'
      }
    }

    post '/reviews', params: review_params

    expect(response.status).to eq 422

    json = JSON.parse(response.body)
    
    expect(json['image']).to include "can't be blank"
  end

  it "doesn't update a review without a name" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params
    review = Review.first

    updated_params = {
      review: {
        name: '',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    patch "/reviews/#{review.id}", params: updated_params

    review = Review.find(review.id)

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    
    expect(json['name']).to include "can't be blank"
  end

  it "doesn't update a review without a rating" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params
    review = Review.first

    updated_params = {
      review: {
        name: 'Stella',
        rating: nil,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    patch "/reviews/#{review.id}", params: updated_params

    review = Review.find(review.id)

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    
    expect(json['rating']).to include "can't be blank"
  end

  it "doesn't update a review without a description" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params
    review = Review.first

    updated_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: '',
        location: 'San Marcos',
        image: 'image'
      }
    }

    patch "/reviews/#{review.id}", params: updated_params

    review = Review.find(review.id)

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    
    expect(json['description']).to include "can't be blank"
  end

  it "doesn't update a review without a location" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params
    review = Review.first

    updated_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: '',
        image: 'image'
      }
    }

    patch "/reviews/#{review.id}", params: updated_params

    review = Review.find(review.id)

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    
    expect(json['location']).to include "can't be blank"
  end

  it "doesn't update a review without an image" do
    review_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: 'image'
      }
    }

    post '/reviews', params: review_params
    review = Review.first

    updated_params = {
      review: {
        name: 'Stella',
        rating: 3,
        description: 'Average',
        location: 'San Marcos',
        image: ''
      }
    }

    patch "/reviews/#{review.id}", params: updated_params

    review = Review.find(review.id)

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    
    expect(json['image']).to include "can't be blank"
  end

end