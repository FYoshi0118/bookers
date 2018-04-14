class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save # 保存できた場合
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(book.id)
    else # 保存出来なかった場合
      flash[:blank] = 'Please enter Title and Body'
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:success] = 'Book was successfully updated.'
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:destroy] = 'Book was successfully destoyed.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
