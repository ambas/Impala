#
# Be sure to run `pod lib lint Impala.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Impala"
  s.version          = "0.1.5"
  s.summary          = "Swift tools set for AM."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "It feels like I only go backwards baby
                       Every part of me says \"go ahead\".
                       I got my hopes up again, oh no... not again.
                       Feels like we only go backwards darling."

  s.homepage         = "https://github.com/ambas/Impala"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ambas Chobsanti" => "ambaschobsanti@gmail.com" }
  s.source           = { :git => "https://github.com/ambas/Impala.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Impala' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'HHRouter', '~> 0.1.5'
  s.dependency 'FSCalendar', '~> 1.8.1'
end
