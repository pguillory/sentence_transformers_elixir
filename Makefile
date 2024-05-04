.PHONY: clean

priv/venv:
	priv/create_venv.sh

clean:
	rm -rf priv/venv
