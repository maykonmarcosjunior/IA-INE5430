all:
	@echo "make run: to run the program"
	@echo "make env: to create a virtual environment"

run:
	@python3 AG/main.py
# creates a virtual environment
# and initializes it with the required
env:
	@python3 -m venv env
	@source env/bin/activate
	@pip3 install -r requirements.txt

