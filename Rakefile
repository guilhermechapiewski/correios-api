require 'spec/rake/spectask'
require "rcov/rcovtask"
 
desc "Run all tests and check test coverage"
task :default => "test"
 
desc "Run tests"
task :test => "test:spec"

desc "Run tests"
task :coverage => "test:coverage"

desc "Clean"
task :clean do
  system "rm -rf reports"
  system "rm -rf correios-api-*.gem"
end

namespace :test do
  desc "Run specs"
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.spec_files = FileList["spec/**/*_spec.rb"]
  end
 
  desc "Measure test coverage"
  Spec::Rake::SpecTask.new(:coverage) do |rcov|
    rcov.rcov = true
    rcov.rcov_dir = "reports/coverage"
    rcov.spec_opts = ["--format", "html:reports/specs/index.html", "--diff"]
    rcov.fail_on_error = false
    rcov.verbose = true
  end
end

namespace :gem do
  desc "Build gem"
  task :build do
    system "gem build correios-api.spec"
  end

  desc "Install all gems on which the tests depend on"
  task :install_dependencies do
    system "gem install hpricot sinatra"
  end
end