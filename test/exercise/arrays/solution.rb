module Exercise
  module Arrays
    class << self
      def find_max_num(array)
        array.reduce(0) { |acc, num| num > acc ? num : acc }
      end

      def replace(array)
        max_num = find_max_num(array)
        array.reduce([]) { |acc, num| acc << (num.positive? ? max_num : num) }
      end

      def iter(arr = [], query_num, indxs)
        return -1 if indxs.size == 1 && arr[indxs.first] != query_num

        mid_index = indxs.size / 2
        mid_num = arr[indxs[mid_index]]
        return indxs[mid_index] if mid_num == query_num

        left, right = indxs.each_slice((indxs.size / 2.0).round).to_a
        return iter(arr, query_num, left) if query_num <= mid_num
        return iter(arr, query_num, right) if query_num >= mid_num
      end

      def search(array, query)
        raise ArgumentError, 'Argument is not numeric' unless query.is_a? Numeric
        return -1 if array.size <= 1 && array.first != query
        indexes = Array(0..array.length - 1)
        iter(array, query, indexes)
      end
    end
  end
end
