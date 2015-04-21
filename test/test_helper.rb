require 'minitest/autorun'

class DefinedConstant
  def defined_method; end

  def variable_arity_method(optional=nil); end
end

module Namespace
  class NamespacedConstant
    def defined_method; end
  end

  class OtherConstant < NamespacedConstant
    def world; end
  end
end

module OtherConstant
  def hello; end
end
