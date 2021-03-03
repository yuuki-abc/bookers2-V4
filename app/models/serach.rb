class Serach < ApplicationRecord

  def self.search(method, word, target)

    if target == 'target_user'
      target = User
      column = 'name'
      column2 = 'introduction'
    end

    if target == 'target_book'
      target = Book
      column = 'title'
      column2 = 'body'
    end

    unless target == nil

      if method == "forward_match"
        @posts = target.where("#{column} like ?","#{word}%") \
                        or where("#{column2} like ?","%#{word}%")
      elsif method == "backward_match"
        @posts = target.where("#{column} like ?","%#{word}") \
                        or where("#{column2} like ?","%#{word}%")
      elsif method == "perfect_match"
        @posts = target.where("#{column} like ?","#{word}") \
                        or where("#{column2} like ?","%#{word}%")
      elsif method == "partial_match"
        @posts = target.where("#{column} like ?","%#{word}%") \
                        or where("#{column2} like ?","%#{word}%")
      else
        @posts = target.all
      end

    end

  end

end