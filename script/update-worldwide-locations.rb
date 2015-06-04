require "open-uri"

world_locations_fixture_path = Rails.root.join("test/fixtures/worldwide_locations.yml")

locations = []
File.open(world_locations_fixture_path, "w") do |file|
  locations = WorldLocation.all.map(&:slug)
  file.puts locations.to_yaml
end

locations.each do |slug|
  puts slug
  json = open("https://www.gov.uk/api/world-locations/#{slug}/organisations.json").read
  organisations_fixture_path = Rails.root.join("test/fixtures/worldwide/#{slug}_organisations.json")
  File.open(organisations_fixture_path, "w") do |file|
    file.puts json
  end
end
