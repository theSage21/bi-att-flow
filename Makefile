deploy: venv
venv: requirements.txt
	test -d venv || virtualenv -p python3 venv
	venv/bin/pip install -Ur requirements.txt
	venv/bin/python -m nltk.downloader
	touch venv/bin/activate
clean:
	@test -d venv && rm -rf venv || echo "no venv"
