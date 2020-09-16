module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        result = array.map do |film|
          next if (film['country'] || '').split(',').count < 2 || film['rating_kinopoisk'].nil?

          next if film['rating_kinopoisk'].nil? || film['rating_kinopoisk'].to_f.zero?

          film['rating_kinopoisk'].to_f
        end.compact
        result.reduce(:+) / result.size
      end

      def chars_count(films, threshold)
        films.map { |film| film['rating_kinopoisk'].to_f >= threshold ? film['name'] : '' }.reduce(0) { |sum, name| sum + name.count('и') }
      end
    end
  end
end
