require 'engtagger'

module KnownItemSearchClassifier
  class FeatureExtractor
    def initialize(string)
      @string = string
      tagger = EngTagger.new
      @tagged = tagger.get_readable string
      @num_words = @tagged.scan(%r{/[A-Z]{2}}).size.to_f

      @mixed_case = is_mixed_case?
      @punctuation_ratio = punctuation_ratio
      @determiner_ratio = determiner_ratio
      @proper_noun_ratio = proper_noun_ratio
      @numeric_count = numeric_count

      # @num_keywords = count_keywords
      # @refers_to_an_item_that_is_known = check_against_known_titles
    end

    def feature_array
      [@mixed_case, @punctuation_ratio, @determiner_ratio, @proper_noun_ratio, @num_words, @numeric_count]
    end

    private

    def is_mixed_case?
      return 1.0 if @string =~ /[A-Z]/ and @string =~ /[a-z]/

      0.0
    end

    def punctuation_ratio
      num_punct = @tagged.scan(%r{/PP}).size.to_f
      num_punct / @num_words
    end

    def determiner_ratio
      num_det = @tagged.scan(%r{/DET}).size.to_f
      num_det / @num_words
    end

    def numeric_count
      @string.scan(/[0-9]/).length
    end

    def proper_noun_ratio
      num_prop_noun = @tagged.scan(%r{/NNP}).size.to_f
      num_prop_noun / @num_words
    end

    def count_keywords; end

    def check_against_known_titles; end

    def count_keywords
      keywords_to_match = %w[journal course textbook]
      num_keywords = 0
      @query_string.split.each do |word|
        num_keywords += 1 if keywords_to_match.include? word.gsub(/[[:punct:]]/, '').downcase
      end
      num_keywords
    end

    def check_against_known_titles
      known_titles = [
        'fountainhead',
        'salt sugar fat'
      ]
      return true if known_titles.include? @query_string.downcase

      false
    end
  end
end
