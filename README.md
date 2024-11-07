# known_item_search_classifier
A ruby gem that classifies search query strings as either known-item searches or unknown-item searches.  It uses features identified by Min-Yen Kan and Danny C.C. Poo in their 2005 paper called Detecting and Supporting Known Item Queries  
in Online Public Access Catalogs](http://www.comp.nus.edu.sg/~kanmy/papers/f57-kan.pdf).  It uses a Guassian Naive Bayes algorithm and winds up being about 74% accurate.

Usage
=====

    # Using the default training set
    require('known_item_search_classifier')
    c = KnownItemSearchClassifier::Classifier.new
    c.is_known_item_search? "Perl Best Practices by Damian Conway" # => :known

    # Using your own training set
    require('known_item_search_classifier')
    c = KnownItemSearchClassifier::Classifier.new
    c.train([
        ["The Illiad by Homer", :known],
        ["bugs", :unknown],
        ["Teaching Community: A Pedagogy of Hope", :known],
        ["pre-exam stress", :unknown]])
    c.train_from_csv('training_set.csv') # With format "where the wild things are",known
    c.is_known_item_search? "Denison Avenue" # => :known

To retrain
==========

```
bin/console
c = KnownItemSearchClassifier::Classifier.new
c.train_from_csv('new_data.csv')
c.custom_training_set.classifier.categories_probabilities # copy this as the return value in lib/known_item_search_classifier/default_training_set.rb
c.custom_training_set.classifier.categories_summaries # copy this as the return value in lib/known_item_search_classifier/default_training_set.rb
```


Tests
=====

`bundle exec rake`
