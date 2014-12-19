# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weixin_merchant/version'

Gem::Specification.new do |spec|
  spec.name          = "weixin_merchant"
  spec.version       = WeixinMerchant::VERSION
  spec.authors       = ["叶树剑"]
  spec.email         = ["yeshujian@shiguangcaibei.com"]
  spec.summary       = %q{For Weixin Merchant funcationalities.}
  spec.description   = %q{The business logic according to Weixin's spec}
  spec.homepage      = "https://github.com/dapic/weixin_merchant"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "weixin_authorize"
  spec.add_dependency "money", "< 7.0.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rake", "~> 10.0"
end
