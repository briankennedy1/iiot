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

today = DateTime.now.strftime('%F')

response = HTTParty.get("https://api-v2launch.trakt.tv/calendars/all/shows/#{today}/30", headers: headers)

episode_response = response.parsed_response

pbar = ProgressBar.create(
  starting_at: 0,
  total: episode_response.length,
  format: "%a %e %P% Processed: %c from %C"
)

episode_response.each do |ep|
  # Check if the SHOW exists
  current_show = Show.where(
    trakt_id: ep['show']['ids']['trakt']
  ).first_or_initialize

  current_show.update(
    title: ep['show']['title'],
    debut_year: ep['show']['year'],
    slug: ep['show']['ids']['slug'],
    trakt_id: ep['show']['ids']['trakt'],
    imdb_id: ep['show']['ids']['imdb'],
    tmdb_id: ep['show']['ids']['tmdb'],
    tvrage_id: ep['show']['ids']['tvrage']
  )

  current_ep = Episode.where(
    tvdb_id: ep['episode']['ids']['tvdb']
  ).first_or_initialize

  ep_title = ep['episode']['title']

  current_ep.update(
    title: ep_title,
    show_id: current_show.id,
    air_date: DateTime.parse(ep['first_aired']),
    number: ep['episode']['number'],
    season: ep['episode']['season'],
    trakt_id: ep['episode']['ids']['trakt'],
    imdb_id: ep['episode']['ids']['imdb'],
    tmdb_id: ep['episode']['ids']['tmdb'],
    tvdb_id: ep['episode']['ids']['tvdb']
  ) unless ep_title.nil? ||
           ep_title == '' ||
           ep_title == 'TBD' ||
           ep_title == 'TBA'
  pbar.increment
end
