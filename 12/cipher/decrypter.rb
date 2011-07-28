require 'rubygems'
require 'raspell'

module Cipher
  class Decrypter
    attr_accessor :keyword, :message

    def initialize(keyword=nil, message=nil)
      @keyword = keyword
      @message = message

      @aspell = Aspell.new("en")
      @aspell.set_option("ignore-case", "true")
    end

    def decrypt
      solution = ""
      (1..25).each do |i|
        if @aspell.check(@keyword.shift(i))
          skeyword = @keyword.shift(i)
          j = -1
          (0..@message.size-1).each do |k|
            solution += if @message[k,1]=~/\w/i
              j+=1
              @message[k,1].shift(-1*(skeyword[j-(skeyword.size*(j/skeyword.size))]-65))
            else
              @message[k,1]
            end
          end

          return solution if seems_a_solution(solution)
        end
      end
      "ERROR::solution not found"
    end

    private
      def seems_a_solution(solution)
        is_a_solution=[]
        solution.words.each{|word| is_a_solution << @aspell.check(word)}
        (is_a_solution.count(true)*100/is_a_solution.size)>85
      end
  end
end
