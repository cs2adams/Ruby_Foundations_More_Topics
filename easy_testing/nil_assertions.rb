require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_nil
    assert_nil(value)
  end
end