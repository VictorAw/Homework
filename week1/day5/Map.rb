class Map
	def initialize
		@map = []
	end

	def []=(key, val)
		assign(key, val)
	end

	def [](key)
		lookup(key)
	end

	def assign(key, val)
		@map.each do |el|
			if el[0] == key
				el[1] = val
				return
			end
		end

		@map << [key, val]
		nil	
	end

	def lookup(key)
		@map.each do |el|
			if el[0] == key
				return el[1]
			end
		end
		nil
	end

	def remove(key)
		@map.each do |el|
			if el[0] == key
				return (@map.delete(el))[1]
			end
		end
		nil
	end

	def show
		@map.dup
	end
end
