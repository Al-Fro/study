module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.reduce(0) { |max, el| max > el ? max : el }
        array.map { |el| el.positive? ? max_el : el }
      end

      def search(array, query, left = 0, right = array.size - 1)
        mid = (left + right) / 2
        return - 1 if array.empty? || left > right 

        return mid if array[mid] == query

        array[mid] > query ? right = mid - 1 : left = mid + 1
        search(array, query, left, right)
      end
    end
  end
end
