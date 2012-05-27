# encoding: UTF-8
# require 'spec/rake/spectask'
# require "rcov/rcovtask"
require 'rspec/core/rake_task'
 
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
  system "cd lib; ruby correios_rest_api.rb"
end

namespace :gem do
  desc "Faz o build do gem."
  task :build do
    system "gem build correios-api.gemspec"
  end

  desc "Instala todas as gems que a correios-api depende."
  task :install_dependencies do
    system "gem install hpricot sinatra"
  end
end

namespace :test do
  desc "Executa todas as specs."
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
 
  desc "Gera relatórios de cobertura de testes e specs."
  RSpec::Core::RakeTask.new(:coverage) do |t|
    t.rcov = true
    # t.rcov_dir = "reports/coverage"
    t.rspec_opts = ["--format", "html:reports/specs/index.html", "--diff"]
    t.fail_on_error = false
    t.verbose = true
  end
end
