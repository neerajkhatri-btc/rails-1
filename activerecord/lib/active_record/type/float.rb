module ActiveRecord
  module Type
    class Float < Value # :nodoc:
      include Helpers::Numeric

      def type
        :float
      end

      alias serialize type_cast

      private

      def cast_value(value)
        case value
        when ::Float then value
        when "Infinity" then ::Float::INFINITY
        when "-Infinity" then -::Float::INFINITY
        when "NaN" then ::Float::NAN
        else value.to_f
        end
      end
    end
  end
end