# frozen_string_literal: true

module KnownItemSearchClassifier
  class DefaultTrainingSet
    def categories_probabilities
      { 'unknown' => 0.552, 'known' => 0.448 }
    end

    def categories_summaries
      { 'unknown' =>
    { 0 => { mean: 0.34782608695652173, standard_deviation: 0.4774351058385226 },
      1 => { mean: 0.024483651893859832, standard_deviation: 0.09877772267472562 },
      2 => { mean: 0.004589371980676328, standard_deviation: 0.032912070012630565 },
      3 => { mean: 0.23732759224252611, standard_deviation: 0.3775861432826544 },
      4 => { mean: 2.5072463768115942, standard_deviation: 1.7511981064219535 },
      5 => { mean: 0.05314009661835749, standard_deviation: 0.44293515127930905 } },
        'known' =>
    { 0 => { mean: 0.6011904761904762, standard_deviation: 0.49111727628992086 },
      1 => { mean: 0.05071208898451003, standard_deviation: 0.10551578513388955 },
      2 => { mean: 0.043913293286663324, standard_deviation: 0.089967379556707 },
      3 => { mean: 0.24845155590636964, standard_deviation: 0.3038306400149365 },
      4 => { mean: 5.071428571428571, standard_deviation: 4.292552286529769 },
      5 => { mean: 2.8214285714285716, standard_deviation: 4.933475325294178 } } }
    end
  end
end
