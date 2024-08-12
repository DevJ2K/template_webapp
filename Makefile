all:
	echo Call all.

init:
	pip install --upgrade pip
	pip install virtualenv
	python3.12 -m venv env
	source env/bin/activate
	pip install requirements.txt
	pip install "fastapi[standard]"

.PHONY: all
