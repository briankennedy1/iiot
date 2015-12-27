# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

headers = { 'content-type' => 'application/json',
            'trakt-api-version' => '2',
            'trakt-api-key' => ENV['TRAKT_API_KEY']
          }

response = HTTParty.get('https://api-v2launch.trakt.tv/calendars/all/shows/2015-12-27/1', headers: headers)

response.parsed_response.each do |ep|
  ep_title = ep['episode']['title']
  show_title = ep['show']['title']
  options = ep_title.nil? || ep_title == '' || ep_title == 'TBD' || ep_title == 'TBA'
  ap "#{show_title}: #{ep_title}" unless options
end
