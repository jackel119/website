all: update build

update:
	npm install
	npm update

build:
	node ./node_modules/wintersmith/bin/wintersmith build
	cd ./build && \
	find ./articles -name "*.jpg" -o -name "*.png" | while read line ; do mogrify -strip -verbose -resize '800x800>' -quality 80 "$$line" ; done

test: build
	[ -f build/index.html ]

preview:
	node ./node_modules/wintersmith/bin/wintersmith preview

clean:
	rm -rf ./build

resize_images:
	find ./contents -name "*.jpg" -o -name "*.png" | while read line ; do mogrify -strip -verbose -resize '800x800>' "$$line" ; done

.PHONY: update build preview clean resize_images
