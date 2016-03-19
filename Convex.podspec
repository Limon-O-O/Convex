Pod::Spec.new do |s|

  s.name        = "Convex"
  s.version     = "0.1"
  s.summary     = "Highly customizable tabBar and tabBarController for iOS."

  s.description = <<-DESC
                   Highly customizable tabBar and tabBarController for iOS.
                   DESC

  s.homepage    = "https://github.com/Limon-O-O/Convex"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.authors           = { "nixzhu" => "zhuhongxu@gmail.com" }
  s.social_media_url  = "https://twitter.com/nixzhu"

  s.ios.deployment_target   = "8.0"
  # s.osx.deployment_target = "10.7"

  s.source          = { :git => "https://github.com/Limon-O-O/Convex.git", :tag => s.version }
  s.source_files    = "Convex/*.swift"
  s.requires_arc    = true

end
