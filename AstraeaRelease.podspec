
Pod::Spec.new do |s|
  s.name         = "AstraeaRelease"
  s.version      = "0.0.8"
  s.summary      = "Astraea release swift sdk"
  s.description  = <<-DESC
  Astraea swift sdk for users
                   DESC

  s.homepage     = "http://www.5ikankan.com/"
  s.license      = "MIT"
  s.author             = { "wenzhaot" => "tanwenzhao1025@gmail.com" }
  s.source       = { :git => "https://github.com/wenzhaot/astraea-sdk-swift.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.vendored_frameworks = ['Release/AstraeaSwift.framework']

  s.source_files  = 'Agora/*.{h,m}'
  s.public_header_files = 'Agora/*.h'
  s.vendored_libraries = ['Agora/*.a']

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS'          => '-framework "AstraeaSwift"'
  }

  s.dependency 'YYCache'
  s.dependency 'TPKeyboardAvoiding'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'SwiftTheme'
  s.dependency 'AstraeaVendor'
  s.dependency 'PureLayout'
  s.dependency 'SDWebImage'
  s.dependency 'Proposer', '~> 1.1.0'
  s.dependency 'MJRefresh'
  s.dependency 'Moya/RxSwift'
  s.dependency 'SwiftyJSON'
  s.dependency 'ObjectMapper', '~> 2.2'
  s.dependency 'SwiftyUserDefaults'

end
