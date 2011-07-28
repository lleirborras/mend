class String
  def shift(i=1)
    result = ""
    self.each_byte do |b|
      result += if b.chr=~/\w/i
        s = b+i
        if s < 65
          s = 90 - (64-s)
        elsif s > 90
          s = 65 + (s-91)
        end
        s.chr
      else
        b.chr
      end
    end
    result
  end

  def words
    self.split(/[^\w\.,\-'"!\?]/i)
  end
end
