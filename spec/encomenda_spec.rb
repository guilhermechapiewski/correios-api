$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../lib")

require "encomenda"
require "encomenda_status"

describe Encomenda do
  before(:each) do
      @encomenda = Encomenda.new("SS123456789BR")

      @status1 = EncomendaStatus.new
      @status1.data = DateTime.parse("2009-01-27T16:35:00+00:00")
      @status1.local = "RIO DE JANEIRO"
      @status1.situacao = "Entregue"
      @status1.detalhes = "Entregue no dia tal"
      
      @status2 = EncomendaStatus.new
      @status2.data = DateTime.parse("2010-01-27T16:35:00+00:00")
      @status2.local = "RIO DE JANEIRO"
      @status2.situacao = "Status 2"
      @status2.detalhes = "Detalhe importante"
  end
  
  it "deveria armazenar todos os status da encomenda" do
    @encomenda.status.should be_empty
    
    @encomenda << @status1
    
    @encomenda.status.should_not be_empty
    @encomenda.status[0].should equal(@status1)
  end
  
  it "deveria informar os status da encomenda em ordem de acontecimento" do
    # coloca o 2 na frente do 1
    @encomenda << @status2
    @encomenda << @status1
    
    @encomenda.status[0].should equal(@status1)
    @encomenda.status[1].should equal(@status2)
  end
  
  it "deveria informar o último status disponível" do
    # coloca o 2 na frente do 1
    @encomenda << @status2
    @encomenda << @status1
    
    @encomenda.should respond_to(:ultimo_status_disponivel)
    @encomenda.ultimo_status_disponivel.should equal(@status2)
  end
  
  it "deveria informar o primeiro status disponível" do
    # coloca o 2 na frente do 1
    @encomenda << @status2
    @encomenda << @status1
    
    @encomenda.should respond_to(:primeiro_status_disponivel)
    @encomenda.primeiro_status_disponivel.should equal(@status1)
  end
  
  it "deveria saber como se transformar em xml" do
    @encomenda.should respond_to(:to_xml)
  end

  it "deveria transformar as informacoes da encomenda em xml corretamente" do
    xml_esperado = "<encomenda numero=\"SS123456789BR\">"
    xml_esperado += "<status data=\"2009-01-27T16:35:00+00:00\">"
    xml_esperado += "<local>RIO DE JANEIRO</local>"
    xml_esperado += "<situacao>Entregue</situacao>"
    xml_esperado += "<detalhes>Entregue no dia tal</detalhes>"
    xml_esperado += "</status>"
    xml_esperado += "<status data=\"2010-01-27T16:35:00+00:00\">"
    xml_esperado += "<local>RIO DE JANEIRO</local>"
    xml_esperado += "<situacao>Status 2</situacao>"
    xml_esperado += "<detalhes>Detalhe importante</detalhes>"
    xml_esperado += "</status>"
    xml_esperado += "</encomenda>"
    
    @encomenda << @status1
    @encomenda << @status2
    @encomenda.to_xml.should eql(xml_esperado)
  end
end