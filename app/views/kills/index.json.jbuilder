json.array!(@kills) do |kill|
  json.extract! kill, :id, :target, :killer, :granted, :date
  json.url kill_url(kill, format: :json)
end
