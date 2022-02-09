class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
    @name = name
    @@all << self
    end

    def self.all
    @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select{|s| s.artist == self}
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find{|x| x.name == name}
    end

    def print_songs
        songs.each {|x| puts x.name}
    end
end