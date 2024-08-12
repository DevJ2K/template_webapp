all:
	echo Call all.

init:
	pip install virtualenv
	python3.12 -m venv env
	source env/bin/activate
	pip install requirements.txt

.PHONY: all
