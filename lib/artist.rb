require 'pry'
class Artist
  extend Concerns::Findable
    attr_accessor :name, :songs, :genre, :song
    @@all = []

    def initialize(name)
        @name = name 
        save
        @songs = []
        # @songs << self
    end 
    
    def genres
      @artist_genre = []
      @songs.each do |song| 
        if @artist_genre.include?(song.genre)
          nil
        else
          @artist_genre << song.genre
        end
      end
      @artist_genre
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
        Artist.new(name)
    end 
    
    def add_song(song)
        # binding.pry
        if song.artist == nil
          song.artist = self
        else
          nil
        end
        if @songs.include?(song)
          nil
        else
          @songs << song
        end
        song
    end



end