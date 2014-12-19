module WeixinMerchant::Model
  class Order < Base
    MONEY_FIELDS = %w(order_total_price order_express_price product_price)
    TIME_FIELDS  = %w(order_create_time)
    TEXT_FIELDS =[
      :order_id,
      :order_status,
      :order_total_price,
      :order_create_time,
      :order_express_price,
      :buyer_openid,
      :buyer_nick,
      :receiver_name,
      :receiver_province,
      :receiver_city,
      :receiver_address,
      :receiver_mobile,
      :receiver_phone,
      :product_id,
      :product_name,
      :product_price,
      :product_sku,
      :product_img,
      :delivery_id,
      :delivery_company,
      :trans_id
    ]
    setup_fields
  end
end
