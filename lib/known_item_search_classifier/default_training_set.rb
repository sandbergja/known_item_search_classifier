module KnownItemSearchClassifier
    class DefaultTrainingSet
        attr_reader :categories_probabilities, :categories_summaries
        def initialize
            @categories_probabilities={:unknown=>0.835, :known=>0.165}
            @categories_summaries= {
                :unknown=>{
                    0=>{:mean=>0.32335329341317365, :standard_deviation=>0.4691630728112455},
                    1=>{:mean=>0.01867693185058454, :standard_deviation=>0.0856521002382124},
                    2=>{:mean=>0.0024950099800399197, :standard_deviation=>0.02318575984424029},
                    3=>{:mean=>0.18252067293983462, :standard_deviation=>0.32649287803592736},
                    4=>{:mean=>2.2634730538922154, :standard_deviation=>1.3497147972472143},
                    5=>{:mean=>0.20958083832335328, :standard_deviation=>1.2933208182456999}},
                :known=>{
                    0=>{:mean=>0.3333333333333333, :standard_deviation=>0.478713553878169},
                    1=>{:mean=>0.034283854046699896, :standard_deviation=>0.07844034834013752},
                    2=>{:mean=>0.06397250092902267, :standard_deviation=>0.10673099909054994},
                    3=>{:mean=>0.06715805055726004, :standard_deviation=>0.1488979015655406},
                    4=>{:mean=>4.696969696969697, :standard_deviation=>4.9591131294116515},
                    5=>{:mean=>3.9393939393939394, :standard_deviation=>5.606577576491037}}}
        end
    end
end
