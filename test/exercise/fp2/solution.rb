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
        acc = Exercise::Fp2::MyArray.new
        my_each do |element|
          acc << yield(element)
        end
        acc
      end

      # Написать свою функцию my_compact
      def my_compact
        acc = Exercise::Fp2::MyArray.new
        my_each do |element|
          acc << element unless element.nil?
        end
        acc
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each do |element|
          acc = acc.nil? ? element : yield(acc, element)
          yield(acc, element) if block_given?
        end
        acc
      end
    end
  end
end
