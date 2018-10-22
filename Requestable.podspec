Pod::Spec.new do |s|
  s.name             = 'Requestable'
  s.version          = '1.0.0'
  s.license          = 'MIT'
  s.summary          = 'Requestable'
  s.homepage         = 'https://arifads.eu'
  s.authors          = { 'Arif De Sousa' => 'arifads@gmail.com' }
  s.source           = { :git => 'https://github.com/ArifADS/Requestable', :tag => s.version }

  s.ios.deployment_target     = '9.0'
  s.ios.framework = 'Foundation'

  s.source_files = 'Sources/**/*.swift'
end
