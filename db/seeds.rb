reviews = [
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
    },
    {
        name: "Pilsner",
        rating: 5,
        description: "refreshing, crisp, tasty",
        location: "San Diego",
        image: "image.png"
    }
]

reviews.each do | each_review |
    Review.create each_review
    puts "creating review #{each_review}"
end