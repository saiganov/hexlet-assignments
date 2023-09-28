# frozen_string_literal: true

# BEGIN
module Model
  attr_reader :attributes, :attribute_options

  def self.included(base)
    base.extend self
  end

  def initialize(attributes = {})
    @attributes = {}

    self.class.attribute_options.each do |name, options|
      method("#{name}=").call attributes.fetch(name, options.fetch(:default, nil))
    end
  end

  def attribute(name, options = {})
    @attribute_options ||= {}
    @attribute_options[name] = options

    define_method :"#{name}" do
      @attributes[name]
    end

    define_method :"#{name}=" do |value|
      @attributes[name] = attribute_value(value, options[:type])
    end
  end

  private

  def attribute_value(value, type)
    return value if type.nil? || value.nil?
    if type == :boolean
      !!value
    elsif type == :datetime
      DateTime.parse value
    elsif type == :integer
      value.to_i
    elsif type == :string
      value.to_s
    else
      value
    end
  end
end
# END
