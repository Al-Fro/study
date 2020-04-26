module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each

      def my_each(&func)
        for el in self
          func.call(el)
        end
      end

      # Написать свою функцию my_map
      def my_map(&func)
        my_array = MyArray.new
        my_each { |el| my_array << func.call(el) }
        my_array
      end

      # Написать свою функцию my_compact
      def my_compact
        my_array = MyArray.new
        for el in self
          my_array << el unless el.nil?
        end
        my_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        my_array = acc.nil? ? self[1, size - 1] : self
        acc = acc.nil? ? first : acc
        my_array.my_each { |el| acc = func.call(acc, el) }
        acc
      end
    end
  end
end
