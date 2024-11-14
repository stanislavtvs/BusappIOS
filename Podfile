platform :ios, '13.0'

target 'BusApp' do
  use_frameworks!

  # Firebase Pods
  pod 'Firebase/Core'
  pod 'FirebaseAuth'
  pod 'Firebase/Firestore'
  pod 'GoogleSignIn'
  pod 'FBSDKLoginKit'
  pod 'FBSDKCoreKit'
  pod 'AppAuth', '~> 1.2'

  # Add the missing GoogleUtilities pod explicitly
  pod 'GoogleUtilities'

  # Optional dependencies for network requests and secure data storage
  pod 'Alamofire'
  pod 'KeychainAccess'

  target 'BusAppTests' do
    inherit! :search_paths
    pod 'GoogleSignIn'
  end

  target 'BusAppUITests' do
    pod 'GoogleSignIn'
  end
end

# Post install configurations
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end

