
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rsyslibs/version'

Gem::Specification.new do |spec|
  spec.name          = 'rsyslibs'
  spec.version       = Rsyslibs::VERSION
  spec.authors       = ['Amr El-Bakry']
  spec.email         = ['amrrbakry17@gmail.com']

  spec.summary       = 'A simple ruby library to determine the required system-level packages for your
                        project dependencies.'
  spec.description   = 'Rsyslibs collects all local gems in your project and sends them to a web server to determine
                        the system libraries you need to install.'
  spec.homepage      = 'https://github.com/amrrbakry/rsyslibs'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.0'

  spec.add_dependency 'os', '~> 1.0'
  spec.add_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
end
