require 'minitest/unit'

MiniTest::Unit.autorun

class DefinedConstant
  def defined_method; end

  def variable_arity_method(optional=nil); end
end

module Namespace
  class NamespacedConstant
    def defined_method; end
  end
end
