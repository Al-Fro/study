module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each

      def my_each(acc = [], &func)
        first, *rest = self
        acc << first
        func.call(first)
        return acc if rest.empty?

        MyArray.new(rest).my_each(acc, &func)
      end

      # Написать свою функцию my_map
      def my_map(&func)
        my_reduce(MyArray.new) do |acc, el|
          acc << func.call(el)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, el|
          el.nil? ? acc : acc << el
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        arr = acc.nil? ? self[1, size - 1] : self
        acc = self.first if acc.nil?
        first, *rest = arr
        acc = func.call(acc, first)
        return acc if rest.empty?
        
        MyArray.new(rest).my_reduce(acc, &func)
      end
    end
  end
end
