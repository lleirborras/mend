require "rubygems"
require 'treetop'
require 'circuits/binnary_polish_evaluator'


class Circuits::Evaluator
  def self.evaluate(string)

    result = ""
    lines = string.split("\n")
    max_length = lines.max{|a,b| a.size <=> b.size}.size
    @matrix = lines.collect{|l| (l + " "*(max_length-l.size)).chars.to_a.reverse}

    (0..@matrix.first.size-1).collect do |i|
      col = (0..@matrix.size-1).collect{|j| @matrix[j][i]}
      if col.include?("@")
        result = to_s(i+1, col.index("@"))
      end
    end

    parser = Circuits::BinnaryPolishEvaluatorParser.new
    return (parser.parse(result).value ? "on" : "off")

  end

  def self.to_s(i,j)
    i += 1 while i<=@matrix.first.size && @matrix[j][i]=="-"

    case @matrix[j][i]
    when /[AOX]/
      k = j
      k += 1 while k+1 < @matrix.size && @matrix[k+1][i] == "|"
      w1 = to_s(i, k)

      k = j
      k -= 1 while k-1 >= 0 && @matrix[k-1][i] == "|"
      w2 = to_s(i, k)

      "#{@matrix[j][i]}#{w1}#{w2}"
    when /N/
      k = j
      w = if j+1 < @matrix.size && @matrix[j+1][i] == "|"
        k += 1 while k+1 < @matrix.size && @matrix[k+1][i] == "|"
        to_s(i, k)
      else
        k -= 1 while k-1 >= 0 && @matrix[k-1][i] == "|"
        to_s(i, k)
      end

      "#{@matrix[j][i]}#{w}"
    when /[01]/
      @matrix[j][i]
    when /|/
      to_s(i+1, j) if @matrix[j][i+1] == "-"
    end
  end

  def solve c
  end
end
