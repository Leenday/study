module Exercise
  module Arrays
    class << self
      def replace(array)
        find_max_num = lambda do |arr|
          arr.reduce(0) { |acc, num| num > acc ? num : acc }
        end
        highest_num = find_max_num.call(array)
        array.reduce([]) { |acc, num| acc << (num.positive? ? highest_num : num) }
      end

      def search(array, query)
        raise ArgumentError, 'Argument is not numeric' unless query.is_a? Numeric
        return -1 if array.size <= 1 && array.first != query

        iter = lambda do |arr = [], query_num, indxs|
          return -1 if indxs.size == 1 && arr[indxs.first] != query_num

          mid_index = indxs.size / 2
          mid_num = arr[indxs[mid_index]]
          return indxs[mid_index] if mid_num == query_num

          left, right = indxs.each_slice((indxs.size / 2.0).round).to_a
          return iter.call(arr, query_num, left) if query_num <= mid_num
          return iter.call(arr, query_num, right) if query_num >= mid_num
        end
        indexes = Array(0..array.length - 1)
        iter.call(array, query, indexes)
      end
    end
  end
end
