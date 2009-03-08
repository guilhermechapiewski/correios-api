require File.expand_path(File.dirname(__FILE__) + "/../lib/encomenda")
require File.expand_path(File.dirname(__FILE__) + "/../lib/encomenda_status")

describe Encomenda do
  before(:each) do
      @encomenda = Encomenda.new

      @status1 = EncomendaStatus.new
      @status1.data = DateTime.new
      @status1.local = "RIO DE JANEIRO"
      @status1.informacao = "Entregue"
      
      @status2 = EncomendaStatus.new
      @status2.data = DateTime.new + 100
      @status2.local = "RIO DE JANEIRO"
      @status2.informacao = "Status 2"
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
end