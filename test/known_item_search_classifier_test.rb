require 'coveralls'
Coveralls.wear!
require 'minitest/autorun'
require './lib/known_item_search_classifier'


class KnownItemSearchClassifierTest < Minitest::Test
    classifier = KnownItemSearchClassifier::Classifier.new

    known_item_training_set = [
        "little house on the",
        "the inconvenient truth",
        "the question of animal Culture by Kevin N Laland; Bennett G Galef ",
        "Robinson Ken. Creative Schools: The Grassroots Revolution That’s Transforming Eduction.  Viking. 2015. Print",
        "The Boy in Zaquitos",
        "The Mis-Education of the Negro",
        "human relations interpersonal job-oriented skills",
        "Research Methods for Business: A Skill-Building Approach Effectiveness of Instruction Performed through Computer-Assisted Activity Schedules on On-Schedule and Role-Play Skills of Children with Autism Spectrum Disorder",
        "competency skills for the dental assiostant",
        "Why did they kill?: Cambodia in the shadow of genocide",
        "salt sugar fat",
        "Making a Killing: Femicide, Free Trade, and La Frontera",
    ]
    known_item_training_set.each do |query|
        cleaned_up_query = query.gsub(/[[:punct:]]/, '').gsub(/[[:space:]]/, '_')
        define_method("test_#{cleaned_up_query}_is_classified_as_known_item") do
            assert_equal(:known, classifier.is_known_item_search?(query))
        end
    end

    unknown_item_training_set = [
        "earthworms",
        "network security",
        "work stress",
        "mummies",
        "benefits of eating healthyhy",
        "benefits of eating healthy",
        "megadosing vitamin c",
        "nutrition",
        "penquin",
        "bananas",
        "food sourcing",
        "whey protein",
        "exotic animals",
        "sweet home oregon",
        "taylor swift",
        "catholicism",
        "Professional baking ",
        "concussions after the nfl",
        "IVF the US",
        "adoption children the US",
        "Films for the hearing impaired",
        "wolves and the ecosystem",
        "dr. martin luther king",
    ]
    unknown_item_training_set.each do |query|
        cleaned_up_query = query.gsub(/[[:punct:]]/, '').gsub(/[[:space:]]/, '_')
        define_method("test_#{cleaned_up_query}_is_not_false_positive") do
            assert_equal(:unknown, classifier.is_known_item_search?(query))
        end
    end
end
