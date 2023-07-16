require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_odd(odd)
    assert(value.odd?)
  end
end