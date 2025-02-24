Pod::Spec.new do |s|
  s.name             = 'FirebaseCombineSwift'
  s.version          = '7.6.0'
  s.summary          = 'Swift extensions with Combine support for Firebase'

  s.description      = <<-DESC
Combine Publishers for Firebase.
                       DESC

  s.homepage         = 'https://firebase.google.com'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.authors          = 'Google, Inc.'

  s.source           = {
    :git => 'https://github.com/firebase/firebase-ios-sdk.git',
    :tag => 'CocoaPods-' + s.version.to_s
  }

  s.social_media_url = 'https://twitter.com/Firebase'

  s.swift_version         = '5.0'

  ios_deployment_target = '13.0'
  osx_deployment_target = '10.15'
  tvos_deployment_target = '13.0'
  watchos_deployment_target = '6.0'

  s.ios.deployment_target = ios_deployment_target
  s.osx.deployment_target = osx_deployment_target
  s.tvos.deployment_target = tvos_deployment_target
  s.watchos.deployment_target = watchos_deployment_target

  s.cocoapods_version = '>= 1.4.0'
  s.prefix_header_file = false

  source = 'FirebaseCombineSwift/Sources/'
  s.exclude_files = [
    source + 'Core/**/*.swift',
  ]
  s.source_files = [
    source + '**/*.swift',
    source + '**/*.m',
  ]
  s.public_header_files = [
    source + '**/*.h',
  ]

  s.framework = 'Foundation'
  s.ios.framework = 'UIKit'
  s.osx.framework = 'AppKit'
  s.tvos.framework = 'UIKit'

  s.dependency 'FirebaseCore', '~> 7.6'
  s.dependency 'FirebaseAuth', '~> 7.6'
  s.dependency 'FirebaseFunctions', '~> 7.6'
  s.dependency 'FirebaseStorage', '~> 7.6'
  s.dependency 'FirebaseStorageSwift', '~> 7.6-beta'

  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}"',
  }

  s.test_spec 'unit' do |unit_tests|
    unit_tests.scheme = { :code_coverage => true }
    unit_tests.platforms = {
      :ios => ios_deployment_target,
      :osx => osx_deployment_target,
      :tvos => tvos_deployment_target
    }
    unit_tests.source_files = [
      'FirebaseCombineSwift/Tests/Unit/**/*.swift',
      'FirebaseCombineSwift/Tests/Unit/**/*.h',
      'SharedTestUtilities/FIROptionsMock.[mh]',
      'SharedTestUtilities/FIRComponentTestUtilities.[mh]',
    ]
    unit_tests.exclude_files = 'FirebaseCombineSwift/Tests/Unit/**/*Template.swift'
    unit_tests.requires_app_host = true
    unit_tests.pod_target_xcconfig = {
      'SWIFT_OBJC_BRIDGING_HEADER' => '$(PODS_TARGET_SRCROOT)/FirebaseCombineSwift/Tests/Unit/FirebaseCombine-unit-Bridging-Header.h'
    }
    unit_tests.dependency 'OCMock'
    unit_tests.dependency 'FirebaseAuthTestingSupport'
    unit_tests.dependency 'FirebaseFunctionsTestingSupport'
  end
end
