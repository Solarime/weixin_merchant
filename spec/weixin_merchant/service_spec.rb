require 'spec_helper'

describe WeixinMerchant::Service do
  before(:each) { 
    RestClient.log = Logger.new(STDOUT)
    $client = double(
      'WeixinAuthorize::Client',
      is_valid?: true,
      user: double('WeixinAuthorize::ResultHandler', result: user_info), 
      get_order: double('WeixinAuthorize::ResultHandler', result: order_info)
    )
  }

  it "has a valid weixin_authorize client" do
    expect( WeixinMerchant::Service.client).to be_is_valid
  end

  it "retrieves user info" do
    user = WeixinMerchant::Service.get_user("someopenid")
    expect( user ).to be_a WeixinMerchant::Model::User
    expect( user.openid ).to eq user_info['openid']
  end

  it "retrieves order info" do
    order = WeixinMerchant::Service.get_order("someorderid")
    expect( order ).to be_a WeixinMerchant::Model::Order
    expect( order.order_id ).to eq order_info['order']['order_id']
  end

  def user_info
    {
      "subscribe" => 1,
      "openid" => "o2Hzljt7pBjEvfD8JOZdXDToSZSc",
      "nickname" => "Band",
      "sex" => 1,
      "language" => "zh_CN",
      "city" => "广州",
      "province" => "广东",
      "country" => "中国",
      "headimgurl" => "http =>//wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
      "subscribe_time" => 1382694957,
      "unionid" => " o6_bmasdasdsad6_2sgVt7hMZOPfL"
    }
  end

  def order_info
    {
      "order"=>{
        "order_id"=>"10296773390408906291",
        "order_status"=>2,
        "order_total_price"=>7,
        "order_create_time"=>1418892611,
        "order_express_price"=>0,
        "buyer_openid"=>"o2Hzljt7pBjEvfD8JOZdXDToSZSc",
        "buyer_nick"=>"老爱踢牛",
        "receiver_name"=>"叶树剑",
        "receiver_province"=>"北京市",
        "receiver_city"=>"北京市",
        "receiver_address"=>"新源里16号琨莎中心3座801",
        "receiver_mobile"=>"18611111111",
        "receiver_phone"=>"18611111111",
        "product_id"=>"p2HzljmbFj19o5nxRcfNpQB_oAns",
        "product_name"=>"绣倾城",
        "product_price"=>7,
        "product_sku"=>"",
        "product_count"=>1,
        "product_img"=>"http://mmbiz.qpic.cn/mmbiz/aIlCjuXa35Rm7SPWvN7cafwINXoibw6g1L4s07HuUibD6juICRMjic8WDqLGnFHg13T6G4EcTp4Xx7TR4VfYC5bqw/0",
        "delivery_id"=>"",
        "delivery_company"=>"",
        "trans_id"=>"1009000319201412180007577509",
        "receiver_zone"=>""
      }
    }
  end
end

