class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @book = Book.new
  @books=@user.books


  # @book = Book.find(params[:id])
  # @user = @book.user

 end

 def index
  @user = User.new
  @users = User.all
  @book = Book.new
 end

 def edit
  @user = User.find(params[:id])
   if @user!=current_user
    redirect_to user_path(current_user)
   end

 end


 def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
     else
      render 'edit'
     end
 end


 private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end



end

