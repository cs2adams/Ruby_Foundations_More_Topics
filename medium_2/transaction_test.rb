require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    payment = StringIO.new("30\n130\n")
    output = StringIO.new
    payment_msg = "You owe $100.\nHow much are you paying?\n" \
                  "That is not the correct amount. " \
                  "Please make sure to pay the full cost.\n" \
                  "You owe $100.\nHow much are you paying?\n"
    
    assert_output(payment_msg) do
      @transaction.prompt_for_payment(input: payment)
    end

    assert_equal(130.0, @transaction.amount_paid)
  end
end