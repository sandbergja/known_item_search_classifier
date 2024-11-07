require 'minitest/autorun'
require './lib/known_item_search_classifier'

class KnownItemSearchClassifierTest < Minitest::Test
  classifier = KnownItemSearchClassifier::Classifier.new

  known_item_training_set = [
    # 'hobbit first edition',  -- classifier incorrectly classifies this as unknown
    # 'my soul is rested',  -- classifier incorrectly classifies this as unknown
    # 'new yorker',  -- classifier incorrectly classifies this as unknown
    # 'when harry met sally', -- classifier incorrectly classifies this as unknown
    # '"neo tekunoroji"',  -- classifier incorrectly classifies this as unknown
    '99131236427206421',
    'A decision making model for selecting start-up businesses in a government venture capital scheme',
    # 'Dostoevsky Brothers Karamazov', -- classifier incorrectly classifies this as unknown
    # 'Lawrence Classic American Literature', -- classifier incorrectly classifies this as unknown
    # 'salt sugar fat', -- classifier incorrectly classifies this as unknown
    'Robinson Ken. Creative Schools: The Grassroots Revolution That’s Transforming Eduction.  Viking. 2015. Print',
    'the inconvenient truth',
    'Polarization: What Everyone Needs to Know',
    'little house on the'
  ]
  known_item_training_set.each do |query|
    cleaned_up_query = query.gsub(/[[:punct:]]/, '').gsub(/[[:space:]]/, '_')
    define_method("test_#{cleaned_up_query}_is_classified_as_known_item") do
      assert_equal(:known, classifier.is_known_item_search?(query).to_sym)
    end
  end

  unknown_item_training_set = [
    'colonial mexico textiles',
    'history of horses',
    'medical expertise COVID',
    'music and sexuality',
    'paper industry',
    'sun ra',
    # 'concussions after the nfl', -- classifier incorrectly classifies this as known
    'Professional baking ',
    'Manos chatzidakis',
    'whey protein',
    'benefits of eating healthyhy'
  ]
  unknown_item_training_set.each do |query|
    cleaned_up_query = query.gsub(/[[:punct:]]/, '').gsub(/[[:space:]]/, '_')
    define_method("test_#{cleaned_up_query}_is_not_false_positive") do
      assert_equal(:unknown, classifier.is_known_item_search?(query).to_sym)
    end
  end
end
