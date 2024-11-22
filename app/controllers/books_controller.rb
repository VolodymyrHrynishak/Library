class BooksController < ApplicationController
    before_action :set_book, only: [:show, :destroy]
  
    def index
      @books = Book.all
    end
  
    def show; end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.'
      else
        flash[:alert] = 'Error: Unable to create book.'
        render :new
      end
    end
  
    def destroy
      if @book.destroy
        redirect_to books_path, notice: 'Book was successfully deleted.'
      else
        redirect_to books_path, alert: 'Error: Unable to delete book.'
      end
    end
  
    def search_by_category
      @books = Book.where(category_id: params[:category_id])
    end
  
    private
  
    def set_book
      @book = Book.find(params[:id])
    end
  
    def book_params
      params.require(:book).permit(:title, :author, :publication_year, :genre, :category_id)
    end
  end
  