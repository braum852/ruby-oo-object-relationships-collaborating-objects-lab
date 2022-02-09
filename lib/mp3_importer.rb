class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |x| x.gsub("#{path}/", "") }
    end

    ##Contains a #files method that parses the files in the path, returning an array that contains the file names. Make sure you only get .mp3 files. 
    ##\Google how to get a list of files in a directory! You may want to look at the documentation for Ruby's built-in Dir class (Links to an external site.).

    ##Dir.glob allows you to select just the files you want in a given directory.
    ##* means zero-or-more, and + means one-or-more. So the difference is that the empty string would match the second expression but not the first.
    ##The difference is that sub only replaces the first occurrence of the pattern specified, whereas gsub does it for all occurrences (that is, it replaces globally).
    ##gsub(pattern, replacement)
	##Pattern = The pattern or the string which you want to be replaced.
	##Replacement = A input string to replace the pattern string.


    def import
        files.each{|x| Song.new_by_filename(x)}
    end
    ##Contains an #import method that sends the song names to the Song class. 
    ##Specifically, the method should call Song.new_by_filename, 
    ##which will handle the creation of Song instances and their associated Artist instances.

end