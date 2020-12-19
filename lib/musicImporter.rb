class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end 

    def import

        files.each {|song| Song.new_by_filename(song)}

    end

    
end
