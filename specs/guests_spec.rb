require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')

class TestGuests < Minitest::Test

  def setup
    @guest = Guests.new("George", "Mama Said Knock You Out", 30.00)
  end

  def test_guest_has_name
    expected = "George"
    actual = @guest.name
    assert_equal(expected, actual)
  end

  def test_guest_has_favourite_song
    expected = "Mama Said Knock You Out"
    actual = @guest.favourite_song
    assert_equal(expected, actual)
  end

  def test_guest_has_wallet
    expected = 30.00
    actual = @guest.wallet
    assert_equal(expected, actual)
  end

  def test_guest_has_bar_tab
    expected = 0
    actual = @guest.bar_tab
    assert_equal(expected, actual)
  end





end
