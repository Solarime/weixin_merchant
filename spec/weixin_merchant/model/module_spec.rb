require 'spec_helper'
describe WeixinMerchant::Model do

  let(:subject)               { WeixinMerchant::Model }
  let(:get_order_result)      { double(result: order_info) }
  let(:get_order_list_result) { double(result: { 'order_list' => [order_info['order'], order_info['order']]}) }
  let(:bad_result)            { double('order_result_with_array', result: [order_info, order_info]) }

  it "generates the correct object" do
    expect(subject.from( get_order_result )).to be_a WeixinMerchant::Model::Order
  end
  
  it "generates the correct object with explicit API" do
    expect(subject.from( get_order_result, :order )).to be_a WeixinMerchant::Model::Order
  end

  it "raises error for incorrect api" do
    expect {subject.from( get_order_result, :wrong_api )}.to raise_error RuntimeError, /Could not handle/
    expect {subject.from( get_order_list_result, :wrong_api )}.to raise_error RuntimeError, /Could not handle/
  end

  it "generates a list of correct objects" do
    list = subject.from( get_order_list_result )
    expect(list.size).to eq 2
    expect(list).to contain_exactly an_instance_of(WeixinMerchant::Model::Order),an_instance_of(WeixinMerchant::Model::Order)
    expect(list).to match [an_instance_of(WeixinMerchant::Model::Order),an_instance_of(WeixinMerchant::Model::Order)]
    expect(list[0].order_id).to eq subject.from( get_order_result ).order_id
    #FIXME: this should work
    #expect(list[0]).to eq subject.from( get_order_result)
  end

  it "raises error for a response with multiple 'results'" do
    expect {subject.from( bad_result )}.to raise_error RuntimeError, /Could not handle/
  end

  def order_info
    {"order"=>{"order_id"=>"10296773390408906291", "order_status"=>2, "order_total_price"=>7, "order_create_time"=>1418892611, "order_express_price"=>0, "buyer_openid"=>"o2Hzljt7pBjEvfD8JOZdXDToSZSc", "buyer_nick"=>"老爱踢牛", "receiver_name"=>"叶树剑", "receiver_province"=>"北京市", "receiver_city"=>"北京市", "receiver_address"=>"新源里16号琨莎中心3座801", "receiver_mobile"=>"18611111111", "receiver_phone"=>"18611111111", "product_id"=>"p2HzljmbFj19o5nxRcfNpQB_oAns", "product_name"=>"绣倾城", "product_price"=>7, "product_sku"=>"", "product_count"=>1, "product_img"=>"http://mmbiz.qpic.cn/mmbiz/aIlCjuXa35Rm7SPWvN7cafwINXoibw6g1L4s07HuUibD6juICRMjic8WDqLGnFHg13T6G4EcTp4Xx7TR4VfYC5bqw/0", "delivery_id"=>"", "delivery_company"=>"", "trans_id"=>"1009000319201412180007577509", "receiver_zone"=>""}}
  end
    
end


