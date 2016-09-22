require_relative "dbl_linked_list"

class LRUCache
	def initialize(n)
		@max = n
		@els = {}
		@nodes = DblLinkedList.new
	end

	def count
		@els.size
	end

	def add(el)
		if @els[el]
			@nodes.push_back(@nodes.delete(@els[el]).value)
			return
		end

		if @els.size == @max
			shifted = @nodes.pop_front
			@els.delete(shifted.value)
		end

		@nodes.push_back(el)
		@els[el] = @nodes.back_iter
	end

	def show
		@nodes.display
	end
end

if __FILE__ == $PROGRAM_NAME

	l = LRUCache.new(3)
	p l.count
	l.show
	puts
	l.add(5)
	p l.count
	l.show
	puts
	l.add(5)
	p l.count
	l.show
	puts
	l.add(4)
	p l.count
	l.show
	puts
	l.add(5)
	p l.count
	l.show
	puts
	l.add(6)
	p l.count
	l.show
	puts
	l.add(7)
	p l.count
	l.show

	puts
	puts
	puts

	l = LRUCache.new(4)

	l	.add("I walk the line")
	l.add(5)
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

end

