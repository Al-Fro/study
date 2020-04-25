module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each

      def my_each(&func
        return if self.empty?
        first, *rest = self
        func.call(first)
        my_array = MyArray.new(rest)
        my_array.my_each(&func)
        self
      end

      # Написать свою функцию my_map
      def my_map

      end

      # Написать свою функцию my_compact
      def my_compact
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = 0, &func)
        return acc if self.empty?
        first, *rest = self
        acc = func.call(acc, first)
        my_array = MyArray.new(rest)
        my_array.my_reduce(acc, &func)
      end
    end
  end
end
