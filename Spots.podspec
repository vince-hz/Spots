Pod::Spec.new do |s|
  s.name             = 'Spots'
  s.version          = '1.0.8'
  s.summary          = 'A iOS function modules manager'

  s.description      = <<-DESC
  Spread the event each component
                       DESC

  s.homepage         = 'https://github.com/许允是/Spots'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '许允是' => '405029644@qq.com' }
  s.source           = { :git => 'git@47.98.212.131:module/spots.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'Spots/Classes/**/*'
end
