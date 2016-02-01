Pod::Spec.new do |s|

  s.name             = "react-native-braintree"
  s.version          = "0.3.0"
  s.summary          = "A react native interface for integrating payments using Braintree's v.zero SDK"
  s.homepage         = "https://github.com/alawong/react-native-braintree"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Alan Wong" => "alan.wong@braintreepayments.com" }
  s.source           = { :git => "https://github.com/alawong/react-native-braintree.git", :tag => "0.1.0" }
  s.social_media_url = 'https://twitter.com/alanhhwong'

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'iOS/*'

  s.dependency 'Braintree', '~> 3.9'
  s.dependency 'React'
end
