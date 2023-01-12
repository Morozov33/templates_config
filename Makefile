lint: #linter for code
	poetry run flake8 --ignore=<error_name> <dir_names>

start: #starting dev server for Django
	poetry run python3 manage.py runserver

migrate: #make and add migrations
	poetry run python3 manage.py makemigrations <app_names>
	poetry run python3 manage.py migrate

shell: #start shell by Django
	poetry run python3 manage.py shell_plus

export: #make export dependens from poetry on Heroku
	poetry export -f requirements.txt --output requirements.txt

admin: #create new admin for Django
	poetry run python3 manage.py createsuperuser
