class BooksController < ApplicationController

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      # format.json { render json: @resource }
    end
  end

end
