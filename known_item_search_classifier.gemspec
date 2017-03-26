Gem::Specification.new do |s|
   s.name	= 'known_item_search_classifier'
   s.summary	= 'A ruby gem that classifies search query strings as either known-item searches or unknown-item searches'
   s.version	= '0.2.0'
   s.date	= '2017-03-25'
   s.description	= 'Classify search query strings'
   s.authors	= ['Jane Sandberg']
   s.email	= 'sandbej@linnbenton.edu'
   s.files	= ['lib/known_item_search_classifier.rb', 'lib/known_item_search_classifier/feature_extractor.rb', 'lib/known_item_search_classifier/default_training_set.rb', 'lib/known_item_search_classifier/classifier.rb']
   s.test_files	= ['test/known_item_search_classifier_test.rb']
   s.license	= 'MIT'
   s.homepage   = 'https://github.com/sandbergja/known_item_search_classifier'
   s.add_runtime_dependency	'engtagger', '>=0.2.1'
   s.add_runtime_dependency	'gaussian_naive_bayes', '>=0.1.1'
   s.add_development_dependency	'minitest'
   s.add_development_dependency	'coveralls', '0.7.0'
end
