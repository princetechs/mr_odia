Gem::Specification.new do |spec|
  spec.name          = "mr_odia"
  spec.version       = "0.1.0"
  spec.authors       = ["devsan"]
  spec.email         = ["sandipparida282@gmail.com"]

  spec.summary       = %q{a language for odia by a rubist}
  spec.description   = %q{its a language for odia by a rubist}
  spec.homepage      = "https://www.techlye.com"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "bin/*", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Add dependencies here
  # spec.add_runtime_dependency "dependency_name", "~> version"
  # spec.add_development_dependency "dependency_name", "~> version"
end
