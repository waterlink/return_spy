require "return_spy/version"

require "securerandom"

require "return_spy/support"
require "return_spy/decorator"

module ReturnSpy
  class << self
    def active?
      @active
    end

    def activate!
      @active = true
    end

    def deactivate!
      @active = false
    end

    def without_return_spy
      active = active?
      deactivate!
      yield
      activate! if active
    end

    def expectations
      @_expectations ||= []
    end
  end

  activate!

  def method_added(name)
    common_method_added(name, Decorator::InstanceMethod)
  end

  def singleton_method_added(name)
    common_method_added(name, Decorator::SingletonMethod)
  end

  private

  def common_method_added(name, decorate_strategy)
    return unless ReturnSpy.active?
    new_name = Support.unique_name(name)

    ReturnSpy.without_return_spy do
      decorate_strategy.decorate(self, name, new_name) do |*args, &blk|
        result = send(new_name, *args, &blk)

        ReturnSpy.expectations.each do |expectation|
          next unless expectation === result
          puts "RETURN_SPY: #{self}::#{name} with #{args + [blk]} :: #{result.inspect}"
          break
        end

        result
      end
    end
  end
end

