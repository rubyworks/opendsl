# OpenDSL is a clever way to create a plugable
# free-form domain specific language.
#
#   Example = OpenDSL.new do
#     size do
#       100
#     end
#   end
#
#   class Foo
#     include Example
#   end
#
#   Foo.new.size  #=> 100
#
class OpenDSL < Module

  require 'opendsl/version'

  #
  def initialize(&block)
    instance_eval(&block) if block_given?
  end

  #
  def method_missing(s, *a, &b)
    if block_given?
      define_method(s, &b)
    else
      super(s, *a, &b)
    end
  end

end

