VERSION := '0.1.0'

test:
	rspec

irb: gem
	gem install recaption-${VERSION}.gem
	irb -r 'recaption'

gem: lib/*.rb recaption.gemspec
	gem build recaption.gemspec

clean:
	rm recaption-0.1.0.gem

.PHONY: clean