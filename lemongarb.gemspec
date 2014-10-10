Gem::Specification.new do |s|
  s.name              = 'lemonga.rb'
  s.version           = '1.0.0'
  s.summary           = 'just a harmless prank... for laughs'
  s.author            = 'James Coglan'
  s.email             = 'jcoglan@gmail.com'
  s.homepage          = 'http://github.com/jcoglan/lemonga.rb'
  s.license           = 'GPL'

  s.extra_rdoc_files  = %w[README.md]
  s.rdoc_options      = %w[--main README.md --markup markdown]
  s.require_paths     = %w[lib]

  s.files = %w[README.md] + Dir.glob('lib/**/*.rb')

  s.add_dependency 'activesupport'
  s.add_dependency 'actionpack'
end
