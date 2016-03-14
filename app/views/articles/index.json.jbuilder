json.array!(@articles) do |article|
  json.extract! article, :id, :post, :person_id
  json.url article_url(article, format: :json)
end
