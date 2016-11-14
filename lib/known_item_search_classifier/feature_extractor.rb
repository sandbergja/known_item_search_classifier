require 'engtagger'

module KnownItemSearchClassifier
    class FeatureExtractor
        def initialize string
            @string = string
            tagger = EngTagger.new
            @tagged = tagger.get_readable string
            @num_words = @tagged.scan(/\/[A-Z]{2}/).size.to_f

            @mixed_case = is_mixed_case?
            @punctuation_ratio = punctuation_ratio
            @determiner_ratio = determiner_ratio
            @proper_noun_ratio = proper_noun_ratio

            #@num_keywords = count_keywords
            #@refers_to_an_item_that_is_known = check_against_known_titles
            
        end
        def feature_array
            return [@mixed_case, @punctuation_ratio, @determiner_ratio, @proper_noun_ratio, @num_words]
        end
        private
        def is_mixed_case?
            if @string =~ /[A-Z]/ and @string =~ /[a-z]/
                return 1.0
            end 
            return 0.0
        end
        def punctuation_ratio
            num_punct = @tagged.scan(/\/PP/).size.to_f
            return num_punct / @num_words
        end
        def determiner_ratio
            num_det = @tagged.scan(/\/DET/).size.to_f
            return num_det / @num_words
        end
        def proper_noun_ratio
            num_prop_noun = @tagged.scan(/\/NNP/).size.to_f
            return num_prop_noun / @num_words
        end
        def count_keywords
        end
        def check_against_known_titles
        end
        def count_keywords
            keywords_to_match = ['journal', 'course', 'textbook']
            num_keywords = 0
            @query_string.split.each do |word|
                if keywords_to_match.include? word.gsub(/[[:punct:]]/, '').downcase
                    num_keywords = num_keywords + 1
                end
            end
            return num_keywords
        end
        def check_against_known_titles
           known_titles = [
               'salt sugar fat',
           ]
           if known_titles.include? @query_string.downcase
               return true
           else
               return false
           end
        end
    end
end

