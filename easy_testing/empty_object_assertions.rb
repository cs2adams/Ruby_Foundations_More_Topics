require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_includes_xyz(list)
    assert_includes(list, 'xyz')
  end
end