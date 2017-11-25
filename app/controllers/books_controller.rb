class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  def home
  end
  def about
  end

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    respond_to do |format|
      format.html { redirect_to books_path,notice: 'Book was successfully created.' }
    end
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_path, notice: 'Book was successfully destroyed.' }
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
