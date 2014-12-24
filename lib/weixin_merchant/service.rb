module WeixinMerchant
  class Service
    attr_reader :client
    def initialize(auth_client)
      raise "WeixinMerchant::Service needs a valid weixin_authorize client" unless auth_client.is_valid?
      @client = auth_client
    end

    def get_user(open_id)
      Model.from(client.user(open_id), :user)
    end

    def get_order(order_id)
      Model.from(client.get_order(order_id)) 
    end
  end
end
