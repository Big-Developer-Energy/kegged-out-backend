user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_reviews = [
    {
        name: "Stone Techno Sours",
        rating: 5,
        description: "Tangy with a sweet full flavor",
        location: "Liberty Station, CA",
        image: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Belgian_beer_glass.jpg"
    },
    {
        name: "Julian Cider Black and Blue",
        rating: 5,
        description: "Tart and refreshing",
        location: "Julian, CA",
        image: "https://upload.wikimedia.org/wikipedia/en/e/eb/NBA_in_wellington_glass.jpg"
    }
]
user2_reviews = [ 
    {
        name: "Stone IPA",
        rating: 4,
        description: "Crisp, hoppy and fresh",
        location: "Escondido, CA",
        image: "https://live.staticflickr.com/3657/3420765320_89870286b5_b.jpg"
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