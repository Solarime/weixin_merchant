module WeixinMerchant::Model
  class User < Base
    TIME_FIELDS  = %w(subscribe_time)
    TEXT_FIELDS =%w(subscribe openid nickname sex language city province country headimgurl unionid)
    setup_fields
    def gender
      case sex
      when 1 then 'M'
      when 2 then 'F'
      when 0 then 'U'
      else 'U'
      end
    end

    def is_subscriber?
      subscribe == 1 ? true : false
    end

  end
end
