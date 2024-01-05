user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_reviews = [
    {
        name: "IPA",
        rating: 5,
        description: "bitter, full, delicious",
        location: "San Diego",
        image: "image.png"
    },
    {
        name: "Amber",
        rating: 5,
        description: "Smooth, refreshing",
        location: "San Diego",
        image: "image.png"
    }
]
user2_reviews = [ 
    {
        name: "Pilsner",
        rating: 5,
        description: "refreshing, crisp, tasty",
        location: "San Diego",
        image: "image.png"
    }
]

user1_reviews.each do | each_review |
    user1.reviews.create each_review
    puts "creating review #{each_review}"
end

user2_reviews.each do | each_review |
    user2.reviews.create each_review
    puts "creating review #{each_review}"
end