json.array!(@episodes) do |episode|
  json.extract! episode, :id, :title, :number, :season
  json.url episode_url(episode, format: :json)
end
