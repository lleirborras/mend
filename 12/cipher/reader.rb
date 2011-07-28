module Cipher
  class Reader
    attr_reader :keyword, :message

    def initialize(file)
      f = File.open(file, 'rb')
      lines = f.readlines
      @keyword = lines.first.delete("\n")
      @message = lines[2..-1].join
      f.close
    end
  end
end
