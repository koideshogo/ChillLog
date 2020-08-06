json.array!(@events) do |event|
  json.extract! event, :id, :title, :text
  json.start event.date
  json.end event.date
  json.url event_url(event, format: :html)
  json.image event.image.url
end
