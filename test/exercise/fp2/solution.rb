module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        iter = lambda do |arr, index|
          return arr if index == length

          yield(arr[index]) if block_given?
          iter.call(arr, index + 1)
        end
        iter.call(self, 0)
      end

      # Написать свою функцию my_map
      def my_map
        accum = Exercise::Fp2::MyArray.new
        my_reduce(accum) { |acc, element| acc << yield(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        accum = Exercise::Fp2::MyArray.new
        my_reduce(accum) do |acc, element|
          acc << element unless element.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each do |element|
          acc = acc.nil? ? element : yield(acc, element)
        end
        acc
      end
    end
  end
end
