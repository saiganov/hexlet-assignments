# frozen_string_literal: true
require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_empty_stack
    stack = Stack.new
    assert stack.empty?
  end

  def test_not_empty_stack
    stack = Stack.new
    stack.push!(1)
    refute stack.empty?
  end

  def test_pop_remove_element_from_stack
    stack = Stack.new
    stack.push!(1)
    stack.pop!()
    assert stack.empty?
  end

  def test_pop_return_value
    stack = Stack.new
    stack.push!(1)
    assert_equal stack.pop!, 1
  end

  def test_clear_method_clear_stack
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.clear!
    assert stack.empty?
  end

  def test_size_return_correct_value
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)
    assert_equal stack.size, 3
  end

  def test_to_a_return_correct_value
    stack = Stack.new([1, 2, 3])
    assert_equal stack.to_a, [1, 2, 3]
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
