module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sort_array = array.select do |film|
          key_rating = film['rating_kinopoisk'].to_f
          film['country'].present? && film['country'].split(',').length >= 2 && key_rating != 0
        end
        result = sort_array.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        result / sort_array.length
      end

      def chars_count(films, threshold)
        sort_array = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        sort_array.map { |film| film['name'] }.join('').count('и')
      end
    end
  end
end
