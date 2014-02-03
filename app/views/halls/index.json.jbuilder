json.array!(@halls) do |hall|
  json.extract! hall, :id, :name, :gender
  json.url hall_url(hall, format: :json)
end
