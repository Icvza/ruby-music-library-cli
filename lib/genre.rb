class Genre
    attr_accessor :name, :song, :genre, :artist
    @@all = []
    extend Concerns::Findable
    
    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def songs
        @songs
    end

    def artists
        @genre_artist = []
        @songs.each do |song| 
          if @genre_artist.include?(song.artist)
            nil
          else
            @genre_artist << song.artist
          end
        end
        @genre_artist
    end


    # def add_song(something)
    #     @something = something
    #     @songs < something
    # end


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
        Genre.new(name)
    end


        
    
end