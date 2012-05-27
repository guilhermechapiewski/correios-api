# encoding: UTF-8  
require "rubygems"
require "sinatra"
require "correios"

get "/encomenda/:numero" do
  encomenda = Correios.encomenda(params[:numero])
  xml = "<? xml encoding=\"UTF-8\" version=\"1.0\" ?>\n#{encomenda.to_xml}"
end