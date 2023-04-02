#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint device_imei.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'device_imei'
  s.version          = '0.0.3'
  s.summary          = 'flutter plugins to get real IMEI for Mobile Device.'
  s.description      = <<-DESC
  flutter plugins to get real IMEI for Mobile Device.
                       DESC
  s.homepage         = 'https://github.com/AuliaVailo/device_imei'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Moh. Abdul Haq Aulia' => 'abdul.haq.aulia@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
