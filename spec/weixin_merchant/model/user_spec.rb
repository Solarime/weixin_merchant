require 'spec_helper'

describe WeixinMerchant::Model::User do
  let(:user) { WeixinMerchant::Model.from( double('WeixinAuthorize::ResultHandler', result: user_info), :user)}

  specify {
    expect( user ).to be_a WeixinMerchant::Model::User
    expect( user.openid ).to eq 'o2Hzljt7pBjEvfD8JOZdXDToSZSc'
    expect( user.sex).to eq 1
    expect( user.gender ).to eq 'M'
    expect( user.province).to eq '广东'
    expect( user ).to be_is_subscriber
  }

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

end

