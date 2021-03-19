
class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        split_song = filename.split(" - ")
        song = self.new(split_song[1])
        artist = Artist.find_or_create_by_name(split_song[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        song_artist = Artist.find_or_create_by_name(name)
        @artist = song_artist
        @artist.add_song(self)
    end

end