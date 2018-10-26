class Room

  attr_reader :name, :guests, :playlist

  def initialize(name, guests, playlist)
    @name = name
    @guests = guests
    @playlist = playlist
  end

  def check_in_guest(name)
    @guests << name
  end

  def check_out_guest(name)
    @guests.delete(name)
  end

  def add_song(name)
    @playlist << name
  end 


end
