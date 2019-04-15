class BooksController < ApplicationController
  def index
    @search = OpenStruct.new(
        min_price: (params[:search][:min_price] rescue nil),
        max_price: (params[:search][:max_price] rescue nil),
        min_rank: (params[:search][:min_rank] rescue nil),
        max_rank: (params[:search][:max_rank] rescue nil)
      )
  end
end