class WordGuesserGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    
    #check if letter is from a-zA-Z and not nil
    unless letter.is_a?(String) && letter.match?(/\A[a-zA-Z]\z/)
      raise ArgumentError
    end

    lowerCaseLetter = letter.downcase

    if word.include?(lowerCaseLetter)
      if(guesses.include?(lowerCaseLetter))
        return false
      end
      @guesses += letter
    else
      if(wrong_guesses.include?(lowerCaseLetter))
        return false
      end
      @wrong_guesses += letter
    end
  end


  def word_with_guesses
    res = ''

    @word.each_char do |letter|
      if @guesses.include?(letter)
        res += letter
      else
        res += '-'
      end
    end
    return res
  end
  
  def check_win_or_lose
    if word_with_guesses == @word
      return :win
    elsif @wrong_guesses.length >= 7
      return :lose
    else
      return :play
    end
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('https://randomword.saasbook.info/RandomWord.txt')
    Net::HTTP.get(uri)
  end
end
