class BooksController < ApplicationController

  def top

  end

  def index
    @books=Book.all
    @book=Book.new
    @book_error=@book.errors.full_messages
  end

  def create
    @books=Book.all
    @book=Book.new(book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @book_error=@book.errors.full_messages
      render("books/index")
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
    @book_error=@book.errors.full_messages
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @book_error=@book.errors.full_messages
      render("books/edit")
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end


# ------------！！この下に何もかくな！！----------------
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
