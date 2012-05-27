# encoding: UTF-8  
$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "encomenda_status"

describe EncomendaStatus do
  before(:each) do
      @status = EncomendaStatus.new
      @status.data = DateTime.parse("2009-01-27T16:35:00+00:00")
      @status.local = "RIO DE JANEIRO"
      @status.situacao = "Entregue"
      @status.detalhes = "Entregue no dia tal"
  end

  it "deveria saber como se transformar em xml" do
    @status.should respond_to(:to_xml)
  end

  it "deveria transformar as informacoes do status da encomenda em xml corretamente" do
    xml_esperado = "<status data=\"2009-01-27T16:35:00+00:00\">"
    xml_esperado += "<local>RIO DE JANEIRO</local>"
    xml_esperado += "<situacao>Entregue</situacao>"
    xml_esperado += "<detalhes>Entregue no dia tal</detalhes>"
    xml_esperado += "</status>"
    @status.to_xml.should eql(xml_esperado)
  end
end