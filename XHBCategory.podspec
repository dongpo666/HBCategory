Pod::Spec.new do |s|

  s.name         = "XHBCategory"
  s.version      = "0.0.5"
  s.summary      = "a test 分类集合."
  s.description  = <<-DESC
                    分类集合详细描述
                   DESC
  s.homepage     = "https://github.com/dongpo666/HBCategory"
  s.license      = "MIT"
  s.author       = { "dongpo666" => "1033077885@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/dongpo666/HBCategory.git", :tag => "#{s.version}" }
  s.source_files = "XHBCategory", "XHBCategory/**/*.{h,m}"

end
