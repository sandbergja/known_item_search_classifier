# frozen_string_literal: true

# Classifies search strings as either known-item searches or unknown-item searches
require 'csv'
require 'gaussian_naive_bayes'

module KnownItemSearchClassifier
  class Classifier
    def initialize
      set = DefaultTrainingSet.new
      @default_training_set = GaussianNaiveBayes::Classifier.new set.categories_summaries,
                                                                 set.categories_probabilities
    end

    def is_known_item_search?(query_string)
      classify query_string
    end

    def train(training_set)
      @custom_training_set = GaussianNaiveBayes::Learner.new unless defined? @custom_training_set
      training_set.each do |query|
        submit_vector query
      end
    end

    def train_from_csv(filename)
      @custom_training_set = GaussianNaiveBayes::Learner.new unless defined? @custom_training_set
      csv = ::CSV.read(filename)
      csv.each do |line|
        submit_vector line
      end
    end

    attr_reader :custom_training_set

    private

    def classify(string)
      f = FeatureExtractor.new string
      feature_array = f.feature_array
      if defined? @custom_training_set
        classifier = @custom_training_set.classifier
        query_class = classifier.classify(feature_array)
      else
        query_class = @default_training_set.classify(feature_array)
      end
      return query_class
      return true if query_class == :known

      false
    end

    def submit_vector(arr)
      f = FeatureExtractor.new arr[0]
      @custom_training_set.train f.feature_array, arr[1]
    end
  end
end
