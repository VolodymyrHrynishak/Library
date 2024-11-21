class BooksController < ApplicationController
    def index
        @books = Book.all
      end
    
      def show
        @book = Book.find(params[:id])
      end
    
      def new
        @book = Book.new
      end
    
      def create
        @book = Book.new(book_params)
        if @book.save
          redirect_to @book
        else
          render :new
        end
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :publication_year, :genre, :category_id)
      end
      
      def search_by_category
        @books = Book.where(category_id: params[:category_id])
      end
end
