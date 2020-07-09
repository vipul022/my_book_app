class Book < ApplicationRecord
  belongs_to :author
  validates :title, :author_id, :published_date,  presence: true
  has_many :books_genres
  has_many :genres, through: :books_genres
  has_one_attached :picture
end
