# Slow version
class LRUCache
  def initialize(n)
    @max = n
    @els = []
  end

  def count
		#@els.select { |el| el }.size
		@els.size
  end

  def add(el)
		if count == @max
			@els.shift unless @els.first == el
		end

		for i in 0...@els.size
			if @els[i] == el
				@els << @els.delete_at(i)
				return
			end
		end

		@els << el

  end

  def show
    p @els 
  end
end

=begin
l = LRUCache.new(3)
p l.count
l.show
l.add(5)
p l.count
l.show
l.add(5)
p l.count
l.show
l.add(4)
p l.count
l.show
l.add(5)
p l.count
l.show
l.add(6)
p l.count
l.show
l.add(7)
p l.count
l.show
=end

l = LRUCache.new(4)

l.add("I walk the line")
l.add(5)
p l.count
l.add([1, 2, 3])
l.add(5)
l.add(-5)
l.add({a: 1, b: 2, c: 3})
l.add([1, 2, 3, 4])
l.add("I walk the line")
l.add(:ring_of_fire)
l.add("I walk the line")
l.add({a: 1, b: 2, c: 3})

l.show
