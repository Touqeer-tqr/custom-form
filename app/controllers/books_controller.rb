class BooksController < ApplicationController
  def index
    @my_search = OpenStruct.new({search: OpenStruct.new(min_price: nil, max_price: nil, min_rank: nil, max_rank: nil)})
  end
  def search
  end
end