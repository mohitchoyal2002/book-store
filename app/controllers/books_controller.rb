class BooksController < ApplicationController
  def index
    @books = Book.all
    render :json => @books
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      render :json => {"success": true, "message": "Success"}
    else
      render :json => {"success": false, "message": "failed", "errors": @book.errors}, status: 500
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(title: params[:title], body: params[:body])
      render :json => {"Updated": true}
    else
      render :json => {"Updated": false, "errors": @book.errors}, status: 500
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render :json => {"deleted": true}
  end

  private
    def books_params
      params.require(:book).permit(:title, :body)
    end
end
