# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.delete_all
Flight.delete_all

["ATL", "DFW", "DEN", "ORD", "LAX", "JFK", "LAS", "MCO", "MIA", "CLT"].each do |airport_code|
    Airport.create( {
        airport_code: airport_code
    })
end

flights = [[3, 7, DateTime.new(2024, 1, 23, 12, 15), 3],
[1, 2, DateTime.new(2024, 1, 30, 17, 45), 2],
[2, 9, DateTime.new(2024, 2, 5, 1), 4],
[4, 3, DateTime.new(2024, 2, 16, 11, 15), 8],
[5, 6, DateTime.new(2024, 2, 23, 23, 30), 2],
[6, 2, DateTime.new(2024, 3, 3, 18, 45), 5],
[7, 8, DateTime.new(2024, 3, 18, 14, 30), 9],
[8, 5, DateTime.new(2024, 3, 26, 2, 45), 2],
[9, 10, DateTime.new(2024, 4, 8, 7, 15), 3],
[10, 4, DateTime.new(2024, 4, 23, 1, 30), 7]]

flights.each do |flight|
    Flight.create( {
        departure_airport_id: flight[0],
        arrival_airport_id: flight[1],
        departure_time: flight[2],
        flight_duration: flight[3]
    })
end
