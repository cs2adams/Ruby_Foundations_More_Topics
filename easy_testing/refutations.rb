require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_list_not_include_xyz(list)
    refute_includes(list, 'xyz')
  end
end