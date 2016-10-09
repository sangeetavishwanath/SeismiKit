#
#  Be sure to run `pod spec lint SeismiKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SeismiKit"
  s.version      = "0.0.1"
  s.summary      = "A framework to retrieve earthquake information"
  s.description  = "A framework to retrieve earthquake information"
  s.homepage     = "https://github.com/sangeetavishwanath/SeismiKit"

  s.author             = { "Sangeeta Vishwanath" => "sangeeta.vishwanath@gmail.com" }
  s.social_media_url   = "https://www.linkedin.com/in/sangeetavishwanath"

  s.platform     = :ios, "9.3"
  s.source       = { :git => "https://github.com/sangeetavishwanath/SeismiKit.git", :branch => "master" }

  s.source_files = 'SeismiKit/**/*'
  s.public_header_files = [
    'SeismiKit/SeismiKit.h',
    'SeismiKit/Earthquakes/EarthquakesController.h',
    'SeismiKit/Earthquakes/Model/Earthquake.h',
    'SeismiKit/Earthquakes/Model/EarthquakesList.h'
  ]

  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'Mantle', '~> 2.0'

end
