class ReviewsController < ApplicationController
  before_action :set_book

  def new
    @review = @book.reviews.build
  end

  def create
    @review = @book.reviews.build(review_params)
    @review.user_id = 1 # Призначення користувача, якщо використовується система аутентифікації
  
    if @review.save
      redirect_to books_path, notice: 'Review was successfully created.' # Перенаправлення на головну сторінку
    else
      flash.now[:alert] = 'There was a problem creating your review.'
      render :new
    end
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:content, :user_id)
  end
end
