json.extract! book, :id, :title, :published_date, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
