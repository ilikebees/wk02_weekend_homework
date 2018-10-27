class Room

  attr_reader :name, :guests, :playlist, :capacity, :entry_fee, :till


  def initialize(name, guests, playlist)
    @name = name
    @guests = guests
    @playlist = playlist
    @capacity = 4
    @entry_fee = 5.00
    @till = 0

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
      return false #not full
    else
      return true #full
    end
  end

  def check_in_if_capacity_is_not_full(name)
    if @capacity > @guests.count
      @guests << name
    else
      return true
    end
  end

  def guest_has_entry_fee(name)
    if name.wallet >= @entry_fee
      return true
    else
      return false
    end
  end

  def remove_entry_fee_from_wallet(name)
    if name.wallet >= @entry_fee
      name.wallet - @entry_fee
    end
  end

  def add_entry_fee_to_till(guest)
    if guest.wallet >= @entry_fee
      return @till + @entry_fee
    end
  end

  def guest_has_favourite_song(guest)
    guest.favourite_song
  end

  def guest_favourite_song_on_playlist(name)
    playlist.each do |song|
      if song.title == name.favourite_song
        return "Wooo!"
      end
    end
    return false # this goes here!! REMEMBER THIS GOES HERE because you want it to iterate through all of the songs. What you had before it was only reaching the first song and then returning woo or false.
  end

  # def room_has_bar_tab
  #   return @bar_tab
  # end
  #
  # def add_entry_fee_to_bar_tab(name)
  #   if name.wallet >= @entry_fee
  #     return @bar_tab + @entry_fee
  #   else
  #     return false
  #   end
  #
  # end
  # #
  # def remove_entry_fee_from_bar_tab(amount)
  #   if @bar_tab >= 0
  #     return @bar_tab -= amount
  #   end
  # end






end
