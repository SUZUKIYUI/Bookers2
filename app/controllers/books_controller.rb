class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @user_info=current_user
    @books=Book.all
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
    @user_info=current_user
  end

  def show
    @book=Book.find(params[:id])
    @user_info=@book.user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # この下には記述しないこと

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
