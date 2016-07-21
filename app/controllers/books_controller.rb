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
    @book = Book.create(books_params[:book])
    if @book.save
      flash[:success] = 'New book added!'
      redirect_to books_path
    else
      flash.now[:error] = 'Entries must have a title.'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(params[:id], books_params[:book])
    if @book.save
      flash[:success] = 'Book information updated!'
      redirect_to books_path
    else
      flash.now[:error] = 'Entries must have a title.'
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
end