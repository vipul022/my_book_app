json.extract! books_genre, :id, :book_id, :genre_id, :created_at, :updated_at
json.url books_genre_url(books_genre, format: :json)
