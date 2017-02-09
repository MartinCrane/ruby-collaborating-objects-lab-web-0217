require "pry"
class MP3Importer

	attr_accessor :path, :files

	def initialize(path)
		@path = path
		@files = []

	end

	def files
		files = []
		new_path = @path + "/*"
		Dir[new_path].each do |song|
			files << song[21..-1]
		end
		
		files
	end
	
	def import
		file_arr = files
		files.each do |song|
			song_arr = song.split(" - ")
			artist = Artist.find_or_create_by_name(song_arr[0])
			song = Song.new(song_arr[1])
			artist.add_song(song)
		end
	end
end
