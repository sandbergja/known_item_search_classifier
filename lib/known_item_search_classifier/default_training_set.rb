module KnownItemSearchClassifier
    class DefaultTrainingSet
        attr_reader :categories_probabilities, :categories_summaries
        def initialize
            @categories_probabilities={:unknown=>0.78, :known=>0.22}
            @categories_summaries= {
                :unknown=>{
                    0=>{:mean=>0.2564102564102564, :standard_deviation=>0.4394771815921655},
                    1=>{:mean=>0.03418803418803419, :standard_deviation=>0.11344969312798027},
                    2=>{:mean=>0.002564102564102564, :standard_deviation=>0.0226455406828919},
                    3=>{:mean=>0.12991452991452992, :standard_deviation=>0.26648206508636013},
                    4=>{:mean=>2.7948717948717947, :standard_deviation=>2.053561836691609}},
                :known=>{
                    0=>{:mean=>0.5454545454545454, :standard_deviation=>0.5096471914376255},
                    1=>{:mean=>0.051659451659451655, :standard_deviation=>0.07957404805575267},
                    2=>{:mean=>0.021248196248196245, :standard_deviation=>0.04412470821426937},
                    3=>{:mean=>0.22550505050505054, :standard_deviation=>0.2520704609787127},
                    4=>{:mean=>7.590909090909091, :standard_deviation=>5.770690236086651}}}
        end
    end
end
