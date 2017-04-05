#
# Be sure to run `pod lib lint WYCountingLabelDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WYCountingLabel'
  s.version          = '0.1.0'
  s.summary          = '数字动画'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    使用CoreAnimation实现的数字变动动画，支持时间数字控制
                       DESC

  s.homepage         = 'https://github.com/wangyansnow/WYCountingLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangyansnow' => '13146597377@163.com' }
  s.source           = { :git => 'https://github.com/wangyansnow/WYCountingLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '6.0'

  s.source_files = 'WYCountingLabel/*.{h,m}'

  # s.resource_bundles = {
  #   'WYCountingLabelDemo' => ['WYCountingLabelDemo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
