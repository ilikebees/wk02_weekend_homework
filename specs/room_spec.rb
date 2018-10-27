require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guests')
require_relative('../songs')


class TestRoom < Minitest::Test

  def setup

    @ali = Guests.new("Ali", "Can I Kick It?", 20.00)
    @hamish = Guests.new("Hamish", "Regulate", 10.50)
    @nicola = Guests.new("Nicola", "Shoop", 3.90)
    @giles = Guests.new("Giles", "Don't Stop Moving", 30.00)

    guests = [@ali, @hamish, @nicola, @giles]

    song1 = Songs.new("Regulate")
    song2 = Songs.new("Join the Dots")
    song3 = Songs.new("Bang Bang")

    playlist = [song1, song2, song3]

    @room = Room.new("The Disco Room", guests, playlist)
    @martin = Guests.new("Martin", "I got 5 on it", 8.00)
    @song4 = Songs.new("Bat Out Of Hell")
  end

  def test_room_has_name
    expected = "The Disco Room"
    actual = @room.name
    assert_equal(expected, actual)
  end

  def test_number_of_guests_in_room
    expected = 4
    actual = @room.guests.count
    assert_equal(expected, actual)
  end

  def test_number_of_songs_on_playlist
    expected = 3
    actual = @room.playlist.count
    assert_equal(expected, actual)
  end

  def test_check_in_guests
    expected = 5

    @room.check_in_guest(@martin)
    actual = @room.guests.count

    assert_equal(expected, actual)
  end

  def test_check_out_guests
    expected = 3

    @room.check_out_guest(@ali)
    actual = @room.guests.count

    assert_equal(expected, actual)
  end

  def test_add_song
    expected = 4
    @room.add_song(@song4)
    actual = @room.playlist.count
    assert_equal(expected, actual)
  end

  def test_room_has_capacity
    expected = 4
    actual = @room.capacity
    assert_equal(expected, actual)
  end

  def test_room_at_full_capacity__true
    expected = true
    actual = @room.check_full_capacity
    assert_equal(expected, actual)
  end

  def test_room_at_full_capacity__false
    expected = false
    @room.check_out_guest(@ali)
    actual = @room.check_full_capacity
    assert_equal(expected, actual)
  end

  def test_check_in_if_capacity_is_not_full
  expected = 4
  @room.check_out_guest(@ali)
  actual = @room.check_in_if_capacity_is_not_full(@ali).count
  assert_equal(expected, actual)
  end

  def test_room_has_entry_fee
    expected = 5.00
    actual = @room.entry_fee
    assert_equal(expected, actual)
  end

  def test_guest_has_entry_fee__true
    expected = true
    actual = @room.guest_has_entry_fee(@martin)
    assert_equal(expected, actual)
  end

  def test_guest_has_entry_fee__false
    expected = false
    actual = @room.guest_has_entry_fee(@nicola)
    assert_equal(expected, actual)
  end

  def test_remove_entry_fee_from_wallet
    expected = 5.50
    actual = @room.remove_entry_fee_from_wallet(@hamish)
    assert_equal(expected, actual)
  end

  def test_add_entry_fee_to_till__sufficient_funds
    expected = 5.00
    actual = @room.add_entry_fee_to_till(@hamish)
    assert_equal(expected, actual)
  end

  def test_guest_has_favourite_song
    expected = "Regulate"
    actual = @room.guest_has_favourite_song(@hamish)
    assert_equal(expected, actual)
  end

  def test_guests_favourite_song_on_playlist
    expected = "Wooo!"
    actual = @room.guest_favourite_song_on_playlist(@hamish)
    assert_equal(expected, actual)
  end

  # def test_room_has_bar_tab
  #   expected = 0
  #
  #   actual = @room.bar_tab
  #   assert_equal(expected, actual)
  # end
  #
  # def test_add_entry_fee_to_bar_tab
  #   expected = 5.00
  #   actual = @room.add_entry_fee_to_bar_tab(@ali)
  #   assert_equal(expected, actual)
  # end
  #
  # def test_remove_entry_fee_from_bar_tab
  #   expected = -3.00
  #   actual = @room.remove_entry_fee_from_bar_tab(3.00)
  #   assert_equal(expected, actual)
  # end





end
