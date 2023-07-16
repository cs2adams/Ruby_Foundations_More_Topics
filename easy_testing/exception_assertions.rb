require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ValueTest < MiniTest::Test
  def test_no_experience_error(employee)
    assert_raises(NoExperienceError) { employee.hire }
  end
end