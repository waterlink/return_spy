require 'return_spy/object'
require 'return_spy/module'

class Y
  def greet(name) "hello, #{name}!" end

  def self.greet(name) "hallo, #{name}!" end

  class << self
    def eigen_greet(name) "eigen hello, #{name}!" end
  end
end
