require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
  end

  def test_accept_money
    assert_equal(1000, @cash_register.total_money)

    @transaction.amount_paid = 100
    @cash_register.accept_money(@transaction)

    assert_equal(1100, @cash_register.total_money)
  end

  def test_change
    @transaction.amount_paid = 120
    assert_equal(20, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $100.\n") do
      @cash_register.give_receipt(@transaction)
    end

    assert_nil(@cash_register.give_receipt(@transaction))
  end
end
