# In your python env, run `make install` to insall required packages
# and then either `make` for a single test run
# or `make watch` for a continuous pipeline that reruns on changes.
#
# Comments to cyber.security@digital.cabinet-office.gov.uk
# This is free and unencumbered software released into the public domain.

.SILENT: test install upgrade watch checks Pipfile.lock

test: checks
	pipenv run pytest -sqx --disable-warnings
	echo "✔️ Tests passed!"

checks: #Pipfile.lock
	echo "⏳ running pipeline..."
	set -e
	#pipenv run isort --atomic -yq
	#pipenv run black -q .
	pipenv install pytest 
	pipenv install flake8 
	pipenv run flake8 --max-line-length=88 .  # in line with black
	#pipenv run mypy --pretty .
	echo "✔️ Checks pipeline passed!"
