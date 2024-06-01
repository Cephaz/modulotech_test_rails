# Users
user_paris = User.find_or_create_by!(email: 'uno@test.test') { |u| u.password = '123456' }
user_barcelona = User.find_or_create_by!(email: 'duo@test.test') { |u| u.password = '123456' }
user_sofia = User.find_or_create_by!(email: 'trio@test.test') { |u| u.password = '123456' }

# Rooms
Room.find_or_create_by!(name: 'la chambre etoile', location: 'paris', capacity: 2,
                        price_per_night_cents: Money.new(100_00, 'EUR'), user: user_paris) do |room|
  room.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'paris_image.jpg')), filename: 'paris_image.jpg')
  room.gallery_images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'paris_gallery.jpg')), filename: 'paris_gallery.jpg')
  room.description = "Cette chambre est confortable et spacieuse, parfaite pour un séjour agréable à Paris"
end

Room.find_or_create_by!(name: 'las playas de espana', location: 'barcelona', capacity: 2,
                        price_per_night_cents: Money.new(100_00, 'EUR'), user: user_barcelona) do |room|
  room.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'barcelona_image.jpg')), filename: 'barcelona_image.jpg')
  room.gallery_images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'barcelona_gallery.jpg')), filename: 'barcelona_gallery.jpg')
  room.description = "Esta habitación es cómoda y espaciosa, perfecta para una estancia agradable en Barcelona"
end

[1, 2, 3].each do |i|
  Room.find_or_create_by!(name: "sofia #{i}", location: 'sofia', capacity: 5,
                          price_per_night_cents: Money.new(100_00, 'EUR'), user: user_sofia) do |room|
    room.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'sofia_image.jpg')), filename: 'sofia_image.jpg')
    room.gallery_images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'sofia_gallery.jpg')), filename: 'sofia_gallery.jpg')
    room.description = "Тази стая е удобна и просторна, идеална за приятен престой в София"
  end
end
