module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array.reduce(0) { |max, el| max > el ? max : el }
        array.map { |el| el.positive? ? max_el : el }
      end

      def search(array, query)
        num = 0
        array.each { |el| num = 1 if el == query }
        return -1 if num != 1

        left = 0
        right = array.size - 1
        mid = (left + right) / 2

          while array[mid] != query
            if array[mid] > query
              right = mid - 1
            else
              left = mid + 1
            end
            mid = (left + right) / 2
          end

        mid
      end
    end
  end
end
