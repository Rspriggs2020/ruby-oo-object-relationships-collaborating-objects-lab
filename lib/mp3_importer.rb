
class MP3Importer

    attr_accessor :path

    def initialize(filename)
        @path = filename
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|file| file == "." || file == ".."}
    end

    def import 
        import_files = self.files
        import_files.each do |file|
            song = Song.new_by_filename(file)
        end
    
    end

end