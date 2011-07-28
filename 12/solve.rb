#!/usr/bin/env ruby

require "cipher/core_ext"
require "cipher/reader"
require "cipher/decrypter"

if ARGV.size < 1 || !File.exists?(ARGV[0])
  puts "Usage: $ bundle exec ruby solve.rb cipher_file.txt"
else
  r = Cipher::Reader.new(ARGV[0])
  result = Cipher::Decrypter.new(r.keyword, r.message).decrypt
  File.open("result.txt", "w+"){|f| f << result}
  puts result
end


