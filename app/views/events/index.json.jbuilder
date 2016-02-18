json.array!(@events) do |event|
  json.extract! event, :id, :body
  json.url event_url(event, format: :json)
end
