class BooksController < ApplicationController
  def index
    @books = Book.order(rank: :desc)
  end 

  def show
    @book = Book.find(params[:id])
  end 

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params[:book])
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(params[:id], book_params[:book])
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def rank
    @book = Book.find(params[:id])
    rank = @book.rank += 1 
    @book.update(rank: rank)
    redirect_to books_path
  end

  private

  def book_params
    params.permit(book: [:title, :author, :description])
  end
end
