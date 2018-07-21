Gem::Specification.new do |s|
  s.name              = "istc"
  s.version           = "1.1.1"
  s.summary           = "a (very) small library for working with ISTC"
  s.description       = "a (very) small library for working with ISTC"
  s.license           = "MIT"
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/istc"
  s.has_rdoc          = true
  s.rdoc_options     << "--title" << "ISTC" << "--line-numbers"
  s.test_files        = Dir.glob("spec/**/*_spec.rb")
  s.files             = Dir.glob("lib/**/*.rb") + [ "MIT-LICENSE", "README.markdown", "CHANGELOG"]
  s.required_ruby_version = ">=1.9.3"

  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", "~> 3.0")
end
