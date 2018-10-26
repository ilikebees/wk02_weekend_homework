class Room

  attr_reader :name, :guests, :playlist, :capacity

  def initialize(name, guests, playlist)
    @name = name
    @guests = guests
    @playlist = playlist
    @capacity = 4
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

  def check_full_capacity
    if @capacity > @guests.count
      return false
    else
      return true
    end
  end

  def check_in_if_capacity_is_not_full(name)
    if @capacity < @guests.count
      @guests << name
    else
      return false
    end
  end

end
