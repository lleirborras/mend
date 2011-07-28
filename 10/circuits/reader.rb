class Circuits::Reader
  def initialize(file)
    f = File.open(file, 'rb')
    @circuits = f.read.split(/\n\n/)
    f.close
    @circuits
  end

  def collect
    @circuits.collect{|c| yield c}
  end
end
