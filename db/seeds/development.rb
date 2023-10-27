# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding development database...'

marvin = User.first_or_create!(email: 'marvin@gmail.com',
                              password: 'password',
                              password_confirmation: 'password',
                              first_name: 'Marvin',
                              last_name: 'Dladla',
                              role: User.roles[:admin])
john = User.first_or_create!(email: 'john@gmail.com',
                            password: 'password',
                            password_confirmation: 'password',
                            name: 'John',
                            first_name: 'John',
                            last_name: 'Doe')
Address.first_or_create!(street: '123 Main St',
                         city: 'Anytown',
                         state: 'CA',
                         zip: '12345',
                         country: 'USA',
                         user: marvin)
Address.first_or_create!(street: '123 Main St',
                         city: 'Anytown',
                         state: 'CA',
                         zip: '12345',
                         country: 'USA',
                         user: john)

elapsed = Benchmark.measure do
    posts =[]
    10.times do |x|
        puts "Createing post #{x}"
        post = Post.new(title: "Title #{x}",
                            body: "Body #{x} Words go here!",
                            user: marvin)
        5.times do |y|
            puts "Creating comment comment #{y} for post #{x}"
            post.comments.build(body: "Comment #{y}",
            user: john)

        end
        posts.push(post)
    end
    Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"
