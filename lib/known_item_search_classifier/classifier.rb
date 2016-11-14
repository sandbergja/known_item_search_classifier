# Classifies search strings as either known-item searches or unknown-item searches
require 'gaussian_naive_bayes'

module KnownItemSearchClassifier
    class Classifier
        def initialize
            set = DefaultTrainingSet.new
            @default_training_set = GaussianNaiveBayes::Classifier.new set.categories_summaries, set.categories_probabilities
        end
        def is_known_item_search? query_string
            return classify query_string
        end
        def train training_set
            if defined? @custom_training_set
                @custom_training_set = GaussianNaiveBayes::Learner.new
            end
            training_set.each do |query|
                submit_vector query
            end
        end
        def train_from_csv filename
            if defined? @custom_training_set
                @custom_training_set = GaussianNaiveBayes::Learner.new
            end
            csv = CSV.read(filename)
            csv.each do |line|
                submit_vector line
            end
        end

    private
        def classify string
            f = FeatureExtractor.new string
            feature_array = f.feature_array
            if defined? @custom_training_set
                classifier = @custom_training_set.classifier
                query_class = classifier.classify(feature_array)
            else
                query_class = @default_training_set.classify(feature_array)
            end
            return query_class
            if :known == query_class
                return true
            else
                return false
            end
        end
        def submit_vector arr
            f = FeatureExtractor.new arr[0]
            @custom_training_set.train f.feature_array, arr[1]
        end
    end
end
