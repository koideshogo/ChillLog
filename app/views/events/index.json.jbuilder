json.array!(@events) do |event|
  json.extract! event, :id, :title, :text
  json.start event.created_at
  json.end event.created_at
  json.url event_url(event, format: :html)
  json.image event.image.url
end