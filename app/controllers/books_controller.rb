class BooksController < ApplicationController

 def index
  @book=Book.new
  @books=Book.all
  @users=User.all

 end

 def create
  @book=Book.new(book_params)
  @book.user_id = current_user.id
  flash[:notice] = "successfully"
   if @book.save
     flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
   else
    @books=Book.all
    render 'index'
   end
 end

  def new
   @book=Book.new
  end

  def edit
   @book=Book.find(params[:id])
    if @book.user==current_user
     render "edit"
    else
     redirect_to books_path
    end
  end

  def show
   @book=Book.find(params[:id])
   @book_new=Book.new
   @user=@book.user
  end

  def update
   @book=Book.find(params[:id])

    if @book.update(book_params)
     flash[:notice] = "successfully"
     redirect_to book_path(@book)
    else
     render :edit
    end
  end

  def destroy
   @book=Book.find(params[:id])
   if @book.user==current_user
   @book.destroy
   redirect_to books_path
   end
  end


  private
  def book_params
   params.require(:book).permit(:title, :body)
  end


end

