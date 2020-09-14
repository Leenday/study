module Exercise
  module Arrays
    class << self
      def replace(array)
        find_max_num = lambda do |arr|
          max_num = 0
          for num in arr
            max_num = num > max_num ? num : max_num
          end
          max_num
        end
        result_arr = []
        highest_num = find_max_num.call(array)
        for num in array
          result_arr << (num.positive? ? highest_num : num)
        end
        result_arr
      end

      def search(array, query)
        raise ArgumentError, 'Argument is not numeric' unless query.is_a? Numeric

        indexes = Array(0..array.length - 1)
        iter = lambda do |arr = [], num_search_for, indxs|
          slice_first_half = ->(collection) { collection[0, collection.length / 2] }
          slice_second_half = ->(collection) { collection[collection.length / 2, collection.length] }
          return arr.first == num_search_for ? indxs.first : -1 if arr.length <= 1
          return iter.call(slice_second_half.call(arr), num_search_for, slice_second_half.call(indxs)) if query >= arr[arr.length / 2]
          return iter.call(slice_first_half.call(arr), num_search_for, slice_first_half.call(indxs)) if query <= arr[arr.length / 2]
        end
        iter.call(array, query, indexes)
      end
    end
  end
end
