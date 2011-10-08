require 'minitest/mock'

class MiniTest::FireMock < MiniTest::Mock
  def initialize(constant)
    @constant_name = constant
    @constant = constantize(constant)

    super()
  end

  def expect(name, retval, args = [])
    if @constant and not @constant.instance_methods.include? name
      raise MockExpectationError, "expected #{@constant_name} to define `#{name}`, but it doesn't"
    end

    super(name, retval, args)
  end

  private
  # Borrowed from ActiveSupport.
  def constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  rescue NameError
    nil
  end
end
