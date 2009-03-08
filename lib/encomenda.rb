class Encomenda
  attr_reader :numero, :status
  
  def initialize(numero)
    @numero = numero
    @status = Array.new
  end
  
  def <<(status)
    @status << status
    @status.sort! do |a,b| 
      a.data <=> b.data
    end
  end
  
  def ultimo_status_disponivel
    @status.last
  end
  
  def primeiro_status_disponivel
    @status.first
  end
  
  #TODO: refactor - nao sei se deveria estar aqui...
  def to_xml
    xml = "<encomenda numero=\"#{@numero}\">"
    @status.each do |status|
      xml += status.to_xml
    end
    xml += "</encomenda>"
  end
end