Pod::Spec.new do |s|

  s.name        = "Convex"
  s.version     = "0.1"
  s.summary     = "Highly customizable tabBar and tabBarController in Swift."

  s.description = <<-DESC
                   Highly customizable tabBar and tabBarController for iOS in Swift.
                   DESC

  s.homepage    = "https://github.com/Limon-O-O/Convex"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.authors           = { "Limon" => "fengninglong@gmail.com" }
  s.social_media_url  = "https://twitter.com/Limon______"

  s.ios.deployment_target   = "8.0"

  s.source          = { :git => "https://github.com/Limon-O-O/Convex.git", :tag => s.version }
  s.source_files    = "Convex/*.swift"
  s.requires_arc    = true

end
