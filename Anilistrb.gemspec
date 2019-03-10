lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/Anilistrb/Version'

Gem::Specification.new do |spec|
  spec.name          = 'Anilistrb'
  spec.version       = Anilistrb::VERSION
  spec.authors       = ['barrettotte']
  spec.email         = ['barrettotte@gmail.com']
  spec.summary       = 'A simple API wrapper for AniList\'s GraphQL API'
  spec.description   = 'A simple API wrapper for AniList\'s GraphQL API'
  spec.homepage      = 'https://github.com/barrettotte/Anilist-Ruby'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  #spec.add_development_dependency 'rubocop', '~> 0.65.0'

  spec.add_runtime_dependency 'httparty', '>= 0.13.7'
  spec.add_runtime_dependency 'json', '>= 2.2'
end
