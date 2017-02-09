class Song
	attr_accessor :name, :artist
	
	# @@songs
	
	def initialize(name)

		@name = name
	
	end

	def self.new_by_filename(name)
		song_arr = name.split(" - ")
		artist = Artist.find_or_create_by_name(song_arr[0])
		song = Song.new(song_arr[1])
		song.artist = artist
		song 
	end
end