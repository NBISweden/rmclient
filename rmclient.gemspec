# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmclient/version'

Gem::Specification.new do |spec|
  spec.name          = "rmclient"
  spec.version       = Rmclient::VERSION
  spec.authors       = ["Mikael Borg"]
  spec.email         = ["mikael.borg@gmail.com"]
  spec.summary       = %q{Simple redmine command line client.}
  spec.description   = %q{rmclient is primarily for logging time on redmine issues. Some limited query features are included to facilitate this.}
  spec.homepage      = "https://github.com/NBISweden/rmclient"
  spec.license       = "GPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "chronic", "~> 0.10.2"
  spec.add_dependency "activeresource", "~> 4.1"
end
