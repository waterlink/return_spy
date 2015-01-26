module ReturnSpy
  module Support
    class << self
      def unique_name(name)
        :"__return_spy_#{name}_#{SecureRandom.hex(8)}"
      end
    end
  end
end
