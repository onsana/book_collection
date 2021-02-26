class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = if user_signed_in?
      Book.includes(:user).where(status: "published").or(Book.where("user_id= ?", current_user.id))
    else
      Book.published
    end
    if params[:tag]
      ids = Book.in_genres_ids(params[:tag])
      @books = @books.where(id: ids)
    end
    @books = @books.recent
  end

  def show
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.new(book_params.merge(user_id: current_user.id))
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :status, :cover, :all_genres)
  end
end