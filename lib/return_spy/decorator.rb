module ReturnSpy
  module Decorator
    module InstanceMethod
      def self.decorate(target, name, new_name, &blk)
        target.class_eval do
          alias_method(new_name, name)
          define_method(name, &blk)
        end
      end
    end

    module SingletonMethod
      def self.decorate(target, name, new_name, &blk)
        target.class_eval do
          eigen = class << self; self end
          eigen.class_eval do
            alias_method(new_name, name)
            define_method(name, &blk)
          end
        end
      end
    end
  end
end
