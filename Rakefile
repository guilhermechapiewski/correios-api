require 'spec/rake/spectask'
require "rcov/rcovtask"
 
task :default => "test"
 
desc "Executa todas as specs."
task :test => "test:spec"

desc "Executa os relatórios de cobertura."
task :coverage => "test:coverage"

desc "Limpa o lixo."
task :clean do
  system "rm -rf reports"
  system "rm -rf correios-api-*.gem"
end

desc "Inicia a API de webservices REST."
task :api do
  system "cd lib; ruby api.rb"
end

namespace :gem do
  desc "Faz o build do gem."
  task :build do
    system "gem build correios-api.spec"
  end

  desc "Instala todas as gems que a correios-api depende."
  task :install_dependencies do
    system "gem install hpricot sinatra"
  end
end

namespace :test do
  desc "Executa todas as specs."
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.spec_files = FileList["spec/**/*_spec.rb"]
  end
 
  desc "Gera relatórios de cobertura de testes e specs."
  Spec::Rake::SpecTask.new(:coverage) do |rcov|
    rcov.rcov = true
    rcov.rcov_dir = "reports/coverage"
    rcov.spec_opts = ["--format", "html:reports/specs/index.html", "--diff"]
    rcov.fail_on_error = false
    rcov.verbose = true
  end
end