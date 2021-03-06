#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "CrashLogRobot"
  s.version          = "0.1.0"
  s.summary          = "A short description of CrashLogRobot."
  s.description      = <<-DESC
                       An optional longer description of CrashLogRobot

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Christos Kapasakalidis" => "xkapasakal@gmail.com" }
  s.source           = { :git => "https://github.com/xkapasakal/CrashLogRobotPod.git", :branch => "master" }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '6.1'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'JSONKit', '~> 1.4.0'
  s.dependency 'CocoaLumberjack', '~> 1.8.0'
end
