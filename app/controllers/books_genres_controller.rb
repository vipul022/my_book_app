class BooksGenresController < ApplicationController
  before_action :set_books_genre, only: [:show, :edit, :update, :destroy]

  # GET /books_genres
  # GET /books_genres.json
  def index
    @books_genres = BooksGenre.all
  end

  # GET /books_genres/1
  # GET /books_genres/1.json
  def show
  end

  # GET /books_genres/new
  def new
    @books_genre = BooksGenre.new
  end

  # GET /books_genres/1/edit
  def edit
  end

  # POST /books_genres
  # POST /books_genres.json
  def create
    @books_genre = BooksGenre.new(books_genre_params)

    respond_to do |format|
      if @books_genre.save
        format.html { redirect_to @books_genre, notice: 'Books genre was successfully created.' }
        format.json { render :show, status: :created, location: @books_genre }
      else
        format.html { render :new }
        format.json { render json: @books_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books_genres/1
  # PATCH/PUT /books_genres/1.json
  def update
    respond_to do |format|
      if @books_genre.update(books_genre_params)
        format.html { redirect_to @books_genre, notice: 'Books genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @books_genre }
      else
        format.html { render :edit }
        format.json { render json: @books_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books_genres/1
  # DELETE /books_genres/1.json
  def destroy
    @books_genre.destroy
    respond_to do |format|
      format.html { redirect_to books_genres_url, notice: 'Books genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books_genre
      @books_genre = BooksGenre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def books_genre_params
      params.require(:books_genre).permit(:book_id, :genre_id)
    end
end
