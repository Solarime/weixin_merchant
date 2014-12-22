require 'weixin_authorize'
module WeixinMerchant
  module Service
    class << self
      def client
        puts "loading WeixinAuthorize::Client" unless $client
        $client ||= WeixinAuthorize::Client.new('wx599b0e05f1873032', "1a959cd64a69da949f5519be7d6887ea")
        $client if $client.is_valid?
      end

      def client=(client)
        $client = client
      end

      def get_user(open_id)
        Model.from(client.user(open_id), :user)
      end

      def get_order(order_id)
        Model.from(client.get_order(order_id)) 
      end

    end
  end
end
