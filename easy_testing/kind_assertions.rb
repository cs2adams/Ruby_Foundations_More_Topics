require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_is_numeric(value)
    assert_equal(true, value.is_a?(Numeric))
  end
end