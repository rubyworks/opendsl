
# The Stuff
class OpenDSL < Module

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

