def attribute (arg, &block)

  if arg.is_a?(Hash)
    arg, default = arg.to_a.first
  else
    arg, default = arg, nil
  end

  define_method "#{arg}" do
    if instance_variable_defined?("@#{arg}")
      instance_variable_get("@#{arg}")
    else
      instance_variable_set("@#{arg}", (block ? instance_eval(&block) : default))
    end
  end

  define_method "#{arg}=" do |argument|
    instance_variable_set("@#{arg}", argument)
  end

  define_method "#{arg}?" do
    instance_variable_get("@#{arg}")
  end

end