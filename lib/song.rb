class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_inst = self.new(song)
        new_inst.artist_name = artist
        new_inst 
    end

##It must parse a filename to find the song name and artist name. (Hint: every file separates the song and artist with a " - ").
##From here, we will create a new song instance using the song name we gathered from the filename.
##We'll also want to associate that new song with the appropriate artist. Use the artist attribute accessor to assign this
##Return the new song instance.

##You may have seen something similar in the past where we have the instance of the artist. If we had the artist object, 
##we could simply assign the artist to the song with some code that looks like this: our_song_instance.artist = our_artist_instance. 
##Since we only have the artist name as a string (not an instance of the Artist class), 
##we'll create a method that takes in the name and gets the artist object. Let's call this Song#artist_name=.

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
    ##This method will do two things. Both of these things will involve collaboration with the Artist class:

    ##Turn the artist's name as a string into an Artist object.

    ##First we need to get the instance of the Artist class that represents that artist. There are two possibilities here:

    ##Either we have to create that Artist instance, or
    ##it already exists and we have to find that Artist instance.
    ##To achieve this, we'll need to collaborate with the Artist class. We want to send an artist's name 
    ##(a string — remember we are getting this from the parsed filename) to the Artist class and either create or find the artist instance. 
    ##This sounds like a great place to use method Artist.find_or_create_by_name.

    ##Assign the song to the artist. Now that we have the artist instance, 
    ##we'll want to again collaborate with the Artist class by calling on the Artist#add_song(some_song) method.
end