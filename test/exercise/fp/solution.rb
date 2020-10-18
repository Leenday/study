module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        accumulator = { rating: 0.0, count: 0 }
        array.each_with_object(accumulator) do |film, acc|
          if film['country'].respond_to? 'split'
            if film['rating_kinopoisk'].to_f > 0.0 && film['country'].split(',').count >= 2
              acc[:rating] += film['rating_kinopoisk'].to_f
              acc[:count] += 1
            end
          end
          acc
        end
        accumulator[:rating] / accumulator[:count]
      end

      def chars_count(films, threshold)
        films.filter_map { |film| film['rating_kinopoisk'].to_f >= threshold ? film['name'].count('и') : 0 }.reduce(:+)
      end
    end
  end
end
