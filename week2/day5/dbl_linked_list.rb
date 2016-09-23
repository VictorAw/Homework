class NodeIterator
	def initialize(n)
		@node = n
	end

	def next
		NodeIterator.new(@node.next)
	end

	def prev
		NodeIterator.new(@node.prev)
	end

	def value
		@node.value
	end

	def ==(other)
		value == other.value
	end

	protected
	def node
		@node
	end
end

class Node
	def initialize(n, p, val=:end)
		@next = n
		@prev = p
		@value = val
	end

	def value
		@value
	end

	def next
		@next
	end

	def prev
		@prev
	end

	def next=(n)
		@next = n
	end

	def prev=(p)
		@prev = p
	end
end

class DblLinkedList
	def initialize
		@head = Node.new(nil, nil)
		@tail = Node.new(nil, @head)
		@head.next = @tail
		@size = 0
	end

	def size
		@size
	end

	def first
		@head.value
	end

	def last
		@tail.value
	end

	def push_back(val)
		new_node = Node.new(@tail, @tail.prev, val)
		@tail.prev.next = new_node
		@tail.prev = new_node
		@size += 1
		nil
	end

	def <<(val)
		push_back(val)
	end

	def push_front(val)
		new_node = Node.new(@head.next, @head, val)
		@head.next.prev = new_node
		@head.next = new_node
		@size += 1
		nil
	end

	def pop_front
		return Node.new unless @head.next != @tail
		
		node = @head.next
		@head.next = node.next
		@head.next.prev = @head
		@size -= 1	

		NodeIterator.new(node)
	end

	def pop_back
		return Node.new unless @tail.prev != @head

		node = @tail.prev
		@tail.prev = node.prev
		@tail.prev.next = @tail
		@size -= 1	
		
		NodeIterator.new(node)
	end

	def insert(insert_after, node_iter)
		previous = NodeExtractor.new.node(insert_after)
		node = NodeExtractor.new.node(node_iter)

		node.next = previous.next
		node.prev = previous
		previous.next = node
		node.next.prev = node
	end

	def delete(node_iter)
		return head_iter if node_iter == head_iter
		return tail_iter if node_iter == tail_iter

		node = NodeExtractor.new.node(node_iter)
		node.next.prev = node.prev
		node.prev.next = node.next

		NodeIterator.new(node)
	end

	def front_iter
		NodeIterator.new(@head.next)
	end

	def back_iter
		NodeIterator.new(@tail.prev)
	end

	def head_iter
		NodeIterator.new(@head)
	end

	def tail_iter
		NodeIterator.new(@tail)
	end

	def display
		f_iter = front_iter
		while f_iter != tail_iter
			p f_iter.value
			f_iter = f_iter.next
		end
	end

	private
	class NodeExtractor < NodeIterator
		def initialize
		end

		def node(iter)
			iter.node
		end	
	end
end

if __FILE__ == $PROGRAM_NAME

	d = DblLinkedList.new
	d << 5
	d << 3

	d.display
	puts

	front_iter = d.front_iter
	p d.delete(front_iter).value

	puts

	d.display

end
