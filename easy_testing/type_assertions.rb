require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_instance_of_numeric(value)
    assert_instance_of(Numeric, value)
  end
end