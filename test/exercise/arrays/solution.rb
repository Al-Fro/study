module Exercise
  module Arrays
    class << self
      def replace(array)
        max_char = array.max
        for i in 0..array.size - 1 do
          array[i] = max_char if array[i].positive?
        end
        array
      end

      def search(array, query)
        if array.include?(query)
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
        else
          -1
        end
      end
    end
  end
end
