require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text_str = @file.read
    @text_obj = Text.new(@text_str.clone)
    @file.close
  end

  def teardown
    @file.close
  end

  def test_swap
    swapped_text = @text_str.gsub('a', 'e')
    assert_equal(swapped_text, @text_obj.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @text_obj.word_count)
  end
end