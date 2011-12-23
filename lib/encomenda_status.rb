# encoding: UTF-8  
class EncomendaStatus
  attr_accessor :data, :local, :situacao, :detalhes
  
  def to_s
    return "#{super.to_s} {data=>#{@data}, local=>#{@local}, situacao=>#{@situacao}, detalhes=>#{@detalhes}}"
  end
  
  #TODO: refactor - nao sei se deveria estar aqui...
  def to_xml
    xml = "<status data=\"#{@data.to_s}\">"
    xml += "<local>#{@local}</local>"
    xml += "<situacao>#{@situacao}</situacao>"
    xml += "<detalhes>#{@detalhes}</detalhes>"
    xml += "</status>"
  end
end