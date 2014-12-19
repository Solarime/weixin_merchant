require 'spec_helper'

describe WeixinMerchant::Model::Order do
  let(:order) { WeixinMerchant::Model.from( double('WeixinAuthorize::ResultHandler', result: order_info), :order)}

  specify { expect(order.order_id).to eq(order_info['order']['order_id'])}
  specify { expect(order.order_status).to eq(order_info['order']['order_status'])}
  specify { expect(order.order_total_price).to eq(Money.new(order_info['order']['order_total_price'], 'CNY'))}
  specify { expect(order.order_create_time).to eq(Time.at(order_info['order']['order_create_time']))}

  def order_info
    {"order"=>{"order_id"=>"10296773390408906291", "order_status"=>2, "order_total_price"=>7, "order_create_time"=>1418892611, "order_express_price"=>0, "buyer_openid"=>"o2Hzljt7pBjEvfD8JOZdXDToSZSc", "buyer_nick"=>"老爱踢牛", "receiver_name"=>"叶树剑", "receiver_province"=>"北京市", "receiver_city"=>"北京市", "receiver_address"=>"新源里16号琨莎中心3座801", "receiver_mobile"=>"18611111111", "receiver_phone"=>"18611111111", "product_id"=>"p2HzljmbFj19o5nxRcfNpQB_oAns", "product_name"=>"绣倾城", "product_price"=>7, "product_sku"=>"", "product_count"=>1, "product_img"=>"http://mmbiz.qpic.cn/mmbiz/aIlCjuXa35Rm7SPWvN7cafwINXoibw6g1L4s07HuUibD6juICRMjic8WDqLGnFHg13T6G4EcTp4Xx7TR4VfYC5bqw/0", "delivery_id"=>"", "delivery_company"=>"", "trans_id"=>"1009000319201412180007577509", "receiver_zone"=>""}}
  end

end

