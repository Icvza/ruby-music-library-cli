# require_relative'../config/enviorment.rb'
require'pry'
class Song

    attr_accessor :name, :genre, :artist
    # attr_reader :artist

    @@all = [] 

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def save
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        Song.new(name)
    end

    def artist=artist
        # binding.pry
        @artist = artist
        artist.add_song(self)
    end

    # def genre=genre
    #     @genre=genre
    #     genre.add_song(self)
    # end

    def genre=genre
        @genre = genre
        if genre.songs.include?(self)
            nil
        else 
            genre.songs << self
        end

        # binding.pry
    end

    def self.find_by_name(name)
        # binding.pry
        @@all.find do |song|
            song.name == name 
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(name)
         x = name.split(" - ")
         artist_name = x[0]
         song_name = x[1]
         genre_name =  x[2].split(".mp3").join
         artist = Artist.find_or_create_by_name(artist_name)
         genre = Genre.find_or_create_by_name(genre_name)
         self.new(song_name, artist, genre)
    # binding.pry
    end

    def self.create_from_filename(name)
        self.new_from_filename(name)
    end





end
