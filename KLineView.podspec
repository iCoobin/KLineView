#
# Be sure to run `pod lib lint KLineView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KLineView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KLineView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/iCoobin/KLineView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iCoobin' => 'shoubin.cheng@5th.work' }
  s.source           = { :git => 'https://github.com/iCoobin/KLineView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'KLineView/Classes/**/*'
  #s.public_header_files = 'KLineView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KLineView' => ['KLineView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.preserve_paths = "Modules"
  s.pod_target_xcconfig = {
      "SWIFT_INCLUDE_PATHS" => "$(SRCROOT)/TokenCore/Modules",
      "OTHER_LDFLAGS" => "-lObjC",
      "SWIFT_OPTIMIZATION_LEVEL" => "-Owholemodule"
  }
  
  s.dependency 'Charts'
  s.dependency 'DGActivityIndicatorView'
  s.dependency 'SnapKit'
end
