require "application_system_test_case"

class BooksGenresTest < ApplicationSystemTestCase
  setup do
    @books_genre = books_genres(:one)
  end

  test "visiting the index" do
    visit books_genres_url
    assert_selector "h1", text: "Books Genres"
  end

  test "creating a Books genre" do
    visit books_genres_url
    click_on "New Books Genre"

    fill_in "Book", with: @books_genre.book_id
    fill_in "Genre", with: @books_genre.genre_id
    click_on "Create Books genre"

    assert_text "Books genre was successfully created"
    click_on "Back"
  end

  test "updating a Books genre" do
    visit books_genres_url
    click_on "Edit", match: :first

    fill_in "Book", with: @books_genre.book_id
    fill_in "Genre", with: @books_genre.genre_id
    click_on "Update Books genre"

    assert_text "Books genre was successfully updated"
    click_on "Back"
  end

  test "destroying a Books genre" do
    visit books_genres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Books genre was successfully destroyed"
  end
end
