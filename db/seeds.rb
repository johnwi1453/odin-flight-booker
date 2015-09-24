# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Passenger.delete_all
Booking.delete_all
Airport.delete_all

lax = Airport.create(code: "LAX", city: "Los Angeles")
sfo = Airport.create(code: "SFO", city: "San Francisco")
szx = Airport.create(code: "SZX", city: "Shenzhen")
dme = Airport.create(code: "DME", city: "Moscow")
cdg = Airport.create(code: "CDG", city: "Paris")
jfk = Airport.create(code: "JFK", city: "New York")
lcy = Airport.create(code: "LCY", city: "London")
tav = Airport.create(code: "TAV", city: "Constantinpole")

duration = { "LAX_SFO" => 1.hour, "LAX_JFK" => 6.hours, "LAX_SZX" => 22.hours, "SFO_LAX" => 1.hour,
  "SFO_JFK" => 5.hours, "SFO_SZX" => 21.hours, "SZX_DME" => 17.hours, "SZX_TAV" => 20.hours,
  "DME_CDG" => 6.hours, "DME_LCY" => 7.hours, "DME_TAV" => 6.hours, "DME_SZX" => 17.hours,
  "CDG_LCY" => 2.hours, "CDG_TAV" => 5.hours, "LCY_CDG" => 2.hours, "LCY_JFK" => 19.hours,
  "JFK_SFO" => 5.hours, "JFK_LAX" => 6.hours, "TAV_DME" => 7.hours, "TAV_CDG" => 9.hours }

Flight.delete_all

Airport.all.each do |airport1|
  Airport.all.each do |airport2|
    unless airport1 == airport2
      dur = duration["#{airport1.code}_#{airport2.code}"]
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: Time.now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 6.hours.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 1.day.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: (1.day + 6.hours).from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 2.days.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: (2.days + 3.hours).from_now, duration: dur)
    end
  end
end