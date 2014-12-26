# WeixinMerchant

This gem encapsulates the interface to Weixin's merchant functionalities (微信小店). Currently implementation is based on version V1.15 of the API doc (微信商铺API手册 V1.15). Please note that only limited business logic is implemented, as most of it should go to your business logic module (or main app). 

It depends on the weixin_authorize gem to communicate with Weixin server. A forked version is used until the calls to Weixin's merchant related APIs are merged into the original repo (lanrion/weixin_authorize)

TODO: implementation is far from complete

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weixin_merchant', github: 'dapic/weixin_merchant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weixin_merchant

## Usage

Create a WeixinAuthorize client, pass it to the constructor of WeixinMerchant::Service

```ruby
service = WeixinMerchant::Service.new( WeixinAuthorize::Client.new(ENV['APP_ID'], ENV['APPSECRET']) )
user = service.get_user('o2Hzljt7pBjEvfD8JOZdXDToSZSc') #the user's openid
order = service.get_order('10296773390408906291') #the order's order_id, from Weixin payment event notification 
```

For more examples, see the spec "spec/weixin_merchant/service_spec.rb"

## Contributing

1. Fork it ( https://github.com/dapic/weixin_merchant/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
