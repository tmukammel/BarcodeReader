#
# Be sure to run `pod lib lint BarcodeReader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BarcodeReader'
  s.version          = '1.0.0'
  s.summary          = 'A simple barcode reader UIView subclass.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simply create a UIView in interface builder and assign custom class BarcodeReaderView. Assign delegate and get output in barcodeOutput(). call startReader() on this view.
                       DESC

  s.homepage         = 'https://github.com/tmukammel/BarcodeReader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tmukammel' => 't.mukammel@aol.com' }
  s.source           = { :git => 'https://github.com/tmukammel/BarcodeReader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tmukammel'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BarcodeReader/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BarcodeReader' => ['BarcodeReader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
