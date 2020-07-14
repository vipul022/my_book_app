class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
   before_action :set_authors_genres, only: [:new, :edit, :create]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
   p "-------@genre_params"
  if params[:book][:genres] == nil
     p "@book.errors---------"
    #  p @book.errors 
     @book = Book.new(book_params)
      return render "new"
  end    

   #maped [:book][:genres] and converted into array of integers 
   p @genre_params = params[:book][:genres].map{ |g| g.to_i}
   
   
  #extracted genres and saved into @genre variable
   @genre = Genre.find(@genre_params)
   p "---------genre"
   p @genre
     @book = Book.new(book_params)
     @book.genres << @genre
    
        
    

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

   
    

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authors_genres
      @authors = Author.all
      @genres = Genre.all
    end

    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :published_date, :author_id, :picture)
    end
end




