module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.filter_map { |film| film['rating_kinopoisk'].to_f if film['rating_kinopoisk'].to_f > 0.0 && film['country'].to_s.split(',').count >= 2 }
        ratings.reduce(:+) / ratings.size
      end

      def chars_count(films, threshold)
        films.filter_map { |film| film['rating_kinopoisk'].to_f >= threshold ? film['name'].count('и') : 0 }.reduce(:+)
      end
    end
  end
end
