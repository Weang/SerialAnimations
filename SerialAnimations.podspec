
Pod::Spec.new do |s|
  s.name             = 'SerialAnimations'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SerialAnimations.'
  s.homepage         = 'https://github.com/Weang/SerialAnimations'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Weang' => 'w704444178@qq.com' }
  s.source           = { :git => 'https://github.com/Weang/SerialAnimations.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'

  s.source_files = 'SerialAnimations/Classes/**/*'
  s.swift_versions = '5.0'
  
end
