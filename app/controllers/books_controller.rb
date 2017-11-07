class BooksController < ApplicationController

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.text
      format.csv do
        render plain: Book.generate_csv(@books)
      end
      format.json do
        json_data = @books.map do |book| # cleans up the way we display the data for json it was not needed to display the json data on its own
          {
            id: book.id,
            title: book.title,
            author: book.author,
            read: book.already_read
          }
        end
        render json: { books: json_data } # this will create a hash with key books and a value which is an array of the has of all books saved in json_data
      end
    end
  end

end
