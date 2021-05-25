all: build

build:
	docker build --build-arg http_proxy --build-arg https_proxy -t pmapper .

run := docker run --env PMAPPER_STORAGE=/code/data --env http_proxy --env https_proxy -v ${HOME}/.aws:/root/.aws -v $$(pwd):/code -w /code -it pmapper 

profile := light-p

help:
	$(run) pmapper --help

create:
	$(run) pmapper --profile $(profile) graph create

graph:
	$(run) pmapper --profile $(profile) visualize --filetype png

privilage_escalation:
	$(run) pmapper --profile $(profile) query -s 'preset privesc *'

sh:
	$(run) bash


