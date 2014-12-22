module WeixinMerchant::Model
  class Base
    attr_accessor :info
    def self.setup_fields
      !self.const_defined?(:TEXT_FIELDS) ||
        self::TEXT_FIELDS.each do |param| self.class_eval <<-EOF
      def #{param} 
        @info['#{param}']
      end
      EOF
      end

      !self.const_defined?(:MONEY_FIELDS) ||
        self::MONEY_FIELDS.each do |param| self.class_eval <<-EOF
      def #{param} 
        Money.new(@info['#{param}'], 'CNY')
      end
      EOF
      end

      !self.const_defined?(:TIME_FIELDS) ||
        self::TIME_FIELDS.each do |param| self.class_eval <<-EOF
      def #{param} 
        Time.at(@info['#{param}']) rescue nil
      end
      EOF
      end
    end

    def initialize(&block)
      yield self if block
    end

  end
end
