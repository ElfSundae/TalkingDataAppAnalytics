Pod::Spec.new do |s|
  s.name = 'TalkingDataAppAnalytics'
  s.version = '4.0.63'
  s.summary = 'TalkingData App Analytics SDK'
  s.homepage = 'https://github.com/ElfSundae/TalkingDataAppAnalytics'
  s.documentation_url = 'https://doc.talkingdata.com/posts/20'
  s.authors = { 'TalkingData' => 'https://www.talkingdata.com' }
  s.license = { :type => 'Copyright', :text => 'Copyright Beijing Tendcloud Tianxia Technology Co., Ltd. All rights reserved.' }
  s.source = { :git => 'https://github.com/ElfSundae/TalkingDataAppAnalytics.git', :tag => s.version }
  s.static_framework = true
  s.platform = :ios, '9.0'

  s.default_subspec = 'Basic'

  s.subspec 'Basic' do |ss|
    ss.source_files = 'SDK/Basic/TalkingData.h', 'TalkingDataAppAnalytics/*.{h,m}'
    ss.vendored_libraries = 'SDK/Basic/libTalkingData.a'
    s.libraries = 'z', 'c++'
  end

  s.subspec 'Full' do |ss|
    ss.source_files = 'SDK/Full/TalkingData.h', 'TalkingDataAppAnalytics/*.{h,m}'
    ss.vendored_libraries = 'SDK/Full/libTalkingData.a'
    s.libraries = 'z', 'c++'
  end
end
