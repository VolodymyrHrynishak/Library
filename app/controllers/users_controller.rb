class UsersController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        @review = @book.reviews.new(review_params)
        @review.user_id = current_user.id 
    
        if @review.save
          redirect_to @book
        else
          render 'books/show'
        end
      end
    
      private
    
      def review_params
        params.require(:review).permit(:content)
      end
end
