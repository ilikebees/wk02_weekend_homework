require('minitest/autorun')
require('minitest/rg')
require_relative('../songs')

class TestSongs < Minitest::Test

  def setup
    @song = Songs.new("Xanadu")
  end

  
  def test_song_has_title
    expected = "Xanadu"
    actual = @song.title
    assert_equal(expected, actual)
  end



end
