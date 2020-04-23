module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sort_array = array.select do |film|
          key_rating = film['rating_kinopoisk'].to_f
          key_country = film['country']
          !key_country.nil? && key_country.split(',').length >= 2 && !key_rating.nil? && key_rating != 0
        end
        sort_array.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+) / sort_array.length
      end

      def chars_count(films, threshold)
        sort_array = films.select do |film|
          key_rating = film['rating_kinopoisk'].to_f
          !key_rating.nil? && key_rating >= threshold
        end
        sort_array.map { |film| film['name'] }.join('').split('').select { |el| el.include?('и') }.size
      end
    end
  end
end
