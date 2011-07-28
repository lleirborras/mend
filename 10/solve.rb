#!/usr/bin/env ruby

require "circuits/evaluator"
require "circuits/reader"

if ARGV.size < 1 || !File.exists?(ARGV[0])
  puts "Usage: $ bundle exec ruby solve.rb circuits_file.txt"
else
  result = Circuits::Reader.new(ARGV[0]).collect do |circuit|
    Circuits::Evaluator.evaluate(circuit)
  end.join("\n")
  File.open("result.txt", "w+"){|f| f << result}
  puts result
end


