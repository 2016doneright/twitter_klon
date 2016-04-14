# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

25.times do |i|
    User.create do |user|
        user.email = Faker::Internet.email
        user.password = "agasdgasdgasd"
        user.avatar = open("db/faces/#{i}.jpg")
        user.cover = open("db/mix/#{i}.jpg")
        user.real_name = Faker::Name.first_name + " " + Faker::Name.last_name
        user.profile_name = (user.real_name).gsub(/\s/,"").downcase
        user.description = Faker::Hacker.say_something_smart
        puts "#{user.real_name} created"
    end
end

hashtags = ["100thingsaboutme", "30GoodMovies", "ifitWereUpToMe", "ToMyFutureKids", "10PlacesiWantToGO", "MyFavoriteLineWhenImMad", "SomeoneCuteOnTwitter", "threewords", "OverUsedWords", "15ThingsGirlsHate", "10FavouriteLyrics", "MyLastWordsBeforeDie", "addictedto", "TheDateWasOverWhen", "20PeopleThinkArePretty", "SomePeopleNeedTo", "FavoriteLinesinClass", "10FavoriteRappers"]

1.times do |i|
    for current in 1..900 
       Tweet.create do |tweet|
          tweet.content = "@" + User.all.sample.profile_name + " " + Faker::Hacker.say_something_smart + " #" + hashtags .sample + "."
          tweet.image = open("db/mix/#{current}.jpg")
          tweet.user_id = User.find(User.pluck(:id).sample).id
       end
    end
end

10000.times do |i|
    Retweet.create do |retweet|
        retweet.tweet_id = Tweet.find(Tweet.ids.sample).id
        retweet.user_id = User.find(User.ids.sample).id
    end
end

puts "====================="
puts "about to do following"

1250.times do(User.all.sample.follow(User.all.sample))end

puts "====================="
puts "about to do liking"

10000.times do (User.all.sample.likes(Tweet.find(Tweet.ids.sample)))end