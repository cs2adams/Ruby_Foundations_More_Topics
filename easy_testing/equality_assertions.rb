require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_xyz(value)
    assert_equal('xyz', value.downcase)
  end
end