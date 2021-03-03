class SearchController < ApplicationController

  def search

    method = params[:search_method]
    word = params[:search_word]
    target = params[:search_target]

    if @posts = Serach.search(method, word, target)
      binding.pry
      a == 'aaa'
    end
  end
end