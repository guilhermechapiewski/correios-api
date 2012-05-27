# encoding: UTF-8
 
Gem::Specification.new do |s|
  s.name = %q{correios-api}
  s.version = "0.1.2"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Guilherme Chapiewski"]
  s.date = %q{2009-03-09}
  s.description = %q{API Ruby/REST para rastreamento de pacotes dos Correios.}
  s.email = %q{guilherme.chapiewski@gmail.com}
  s.executables = ["correios-api"]
  s.files = ["bin/correios-api", "lib/correios_rest_api.rb", "lib/correios.rb", "lib/encomenda.rb", "lib/encomenda_status.rb"]
  s.homepage = %q{http://github.com/guilhermechapiewski/correios-api}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{correios-api}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{API para rastreamento de pacotes dos Correios.}
   
  s.add_dependency(%q<hpricot>, [">= 0.6.164"])
  s.add_dependency(%q<sinatra>, [">= 0.9.0"])
end