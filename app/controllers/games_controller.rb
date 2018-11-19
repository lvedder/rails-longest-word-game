require "open-uri"
require "json"
class GamesController < ApplicationController

  def new
    counter = 0
    @letters = []
    while counter < 9
      letter = 'A'.upto('Z').to_a.sample
      @letters.push(letter)
      counter += 1
    end
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @valid_word = JSON.parse(open(url).read)
    @counter = 0
    @letters = params[:letters]
    @array_word = @word.upcase.split("")
    @array_word.each do |letter|
      if @array_word.count(letter) > @letters.count(letter)
        @counter += 1
      end
    end
  end
end
