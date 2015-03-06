VERSION=1.9
ENV=env
URL_BASE=https://pypi.python.org/packages/source/v/virtualenv

.PHONY: run

run: $(ENV)/bin/ipython
	$(ENV)/bin/ipython notebook

$(ENV)/bin/python: requirements.txt
	curl -O $(URL_BASE)/virtualenv-$(VERSION).tar.gz
	tar xzf virtualenv-$(VERSION).tar.gz
	python virtualenv-$(VERSION)/virtualenv.py $(ENV)
	rm -rf virtualenv-$(VERSION) virtualenv-$(VERSION).tar.gz
	$(ENV)/bin/pip install -r requirements.txt

