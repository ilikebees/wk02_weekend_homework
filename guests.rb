class Guests

  attr_reader :name, :favourite_song, :wallet, :bar_tab

  def initialize(name, favourite_song, wallet)

    @name = name
    @favourite_song = favourite_song
    @wallet = wallet
    @bar_tab = 0
  end


end
