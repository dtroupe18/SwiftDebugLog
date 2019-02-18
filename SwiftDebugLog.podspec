#
# Be sure to run `pod lib lint SwiftDebugLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftDebugLog'
  s.version          = '0.1.1'
  s.summary          = 'Lightweight Swift Debug Logger'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swift library for logging errors in debug. Log statements include the filename, line, and function call.
                       DESC

  s.homepage         = 'https://github.com/Dtroupe18/SwiftDebugLog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dtroupe18' => 'dave.troupe@gmail.com' }
  s.source           = { :git => 'https://github.com/Dtroupe18/SwiftDebugLog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'SwiftDebugLog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftDebugLog' => ['SwiftDebugLog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
