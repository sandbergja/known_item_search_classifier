module KnownItemSearchClassifier
  class DefaultTrainingSet
    attr_reader :categories_probabilities, :categories_summaries

    def initialize
      @categories_probabilities = { 'known' => 0.3333333333333333, 'unknown' => 0.6666666666666666 }
      @categories_summaries =
        { 'known' =>
          { 0 => { mean: 0.6, standard_deviation: 0.5 },
            1 => { mean: 0.0516060606060606, standard_deviation: 0.09910312916958242 },
            2 => { mean: 0.06633333333333333, standard_deviation: 0.13412266359153804 },
            3 => { mean: 0.2575454545454545, standard_deviation: 0.27976953051588926 },
            4 => { mean: 4.76, standard_deviation: 3.8867295592395754 },
            5 => { mean: 3.48, standard_deviation: 4.91697739131132 } },
          'unknown' =>
          { 0 => { mean: 0.18, standard_deviation: 0.38808793449160356 },
            1 => { mean: 0.03966666666666667, standard_deviation: 0.1241245990920947 },
            2 => { mean: 0.009000000000000001, standard_deviation: 0.04482391854210637 },
            3 => { mean: 0.11, standard_deviation: 0.25134558515041244 },
            4 => { mean: 2.44, standard_deviation: 1.0720950308167836 },
            5 => { mean: 0.14, standard_deviation: 0.7001457574195914 } } }
    end
  end
end
