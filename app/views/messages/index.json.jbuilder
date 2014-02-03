json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :text, :target_id, :target_type
  json.url message_url(message, format: :json)
end
