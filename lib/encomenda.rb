class Encomenda
  attr_reader :status
  
  def initialize
    @status = Array.new
  end
  
  def <<(status)
    @status << status
    @status.sort! do |a,b| 
      a.data <=> b.data
    end
  end
end