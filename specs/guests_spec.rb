require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')

class TestGuests < Minitest::Test

  def setup
    @guest = Guests.new("George", "Mama Said Knock You Out")
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

end
