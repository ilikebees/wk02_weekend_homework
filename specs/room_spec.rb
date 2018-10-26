require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guests')
require_relative('../songs')


class TestRoom < Minitest::Test

  def setup

    @ali = Guests.new("Ali", "Can I Kick It?")
    @hamish = Guests.new("Hamish", "Express Yourself")
    @nicola = Guests.new("Nicola", "Shoop")
    @giles = Guests.new("Giles", "Don't Stop Moving")

    guests = [@ali, @hamish, @nicola, @giles]

    song1 = Songs.new("Warren G", "Regulate")
    song2 = Songs.new("Join the Dots", "Roots Manuva")
    song3 = Songs.new("Dr Dre", "Bang Bang")

    playlist = [song1, song2, song3]

    @room = Room.new("The Disco Room", guests, playlist)
    @martin = Guests.new("Martin", "I got 5 on it")
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


end
