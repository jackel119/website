HEAD_REV=$(shell git rev-parse HEAD)

all: update build

update:
	npm install
	npm update

build:
	node ./node_modules/wintersmith/bin/wintersmith build
	cd ./build && \
	find ./articles -name "*.jpg" -o -name "*.png" | while read line ; do mogrify -verbose -resize '800x800>' -quality 80 "$$line" ; done

test: build
	[ -f build/index.html ]

preview:
	node ./node_modules/wintersmith/bin/wintersmith preview

deploy: build
	rm -rf build/.git
	git -C build init .
	git -C build fetch "git@github.com:icdocsoc/icdocsoc.github.io.git" master
	git -C build reset --soft FETCH_HEAD
	git -C build add .
	git -C build status --porcelain && \
	  git -C build commit -m "Deploy icdocsoc/website@${HEAD_REV}" && \
	  git -C build push "git@github.com:icdocsoc/icdocsoc.github.io.git" master:master --force
	cd ..

clean:
	rm -rf ./build

resize_images:
	find ./contents -name "*.jpg" -o -name "*.png" | while read line ; do mogrify -verbose -resize '800x800>' "$$line" ; done

.PHONY: update build preview clean resize_images
