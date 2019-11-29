


Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.0.3'
  s.summary          = 'Library to encode and decode images in WebP format.'
  s.homepage         = 'https://developers.google.com/speed/webp/'
  s.license          = { :type => 'BSD', :file => 'COPYING'}
  s.author           = 'Google Inc.'
  s.source           = { :git => "https://github.com/webmproject/libwebp.git", :tag => 'v1.0.3' }

  s.requires_arc = false

  s.platform = :osx, '10.8'
  s.platform = :ios, '6.0'
  s.platform = :tvos, '9.0'
  s.platform = :watchos, '2.0'

  s.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/' }
  s.preserve_paths = 'src'
  s.compiler_flags = '-D_THREAD_SAFE'
  s.prepare_command = "sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'"

  s.default_subspecs = 'webp', 'demux', 'mux'


  s.subspec 'webp' do |sp|
    sp.source_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/dec/*.{h,c}', 'src/enc/*.{h,c}'
    sp.public_header_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h'
  end

  s.subspec 'demux' do |sp|
    sp.dependency 'libwebp/webp'
    sp.source_files = 'src/demux/*.{h,c}', 'src/webp/demux.h'
    sp.public_header_files = 'src/webp/demux.h'
  end

  s.subspec 'mux' do |sp|
    sp.dependency 'libwebp/demux'
    sp.source_files = 'src/mux/*.{h,c}', 'src/webp/mux.h'
    sp.public_header_files = 'src/webp/mux.h'
  end


end