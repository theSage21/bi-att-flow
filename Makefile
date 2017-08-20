deploy: venv
venv: requirements.txt setup.py
	test -d venv || virtualenv -p python3 venv
	venv/bin/pip install -Ur requirements.txt
	touch venv/bin/activate
	test -d glove.840B.300d.txt || curl -O https://nlp.stanford.edu/data/glove.840B.300d.zip && unzip glove.840B.300d.zip && rm glove.840B.300d.zip
	test -d $PWD/data/squad/train-v1.1.json || wget https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json -O $PWD/data/squad/train-v1.1.json
clean:
	@test -d venv && rm -rf venv || echo "no venv"
