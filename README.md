# Template Project

## Pre-requisites

- [Poetry](https://python-poetry.org/docs/)

## Poetry Virtual Environment Installation

## Pre-requisites

- [Poetry](https://python-poetry.org/docs/)

## Virtual Environment setup

The following steps are required to setup the virtual environment for the project. This will create
a `.venv/` folder at the project's root path.
```bash
# install poetry in python global interpreter
# - Any python version can be used to install Poetry globally via pip, but the virtual environment creation
#   should be done using the same python version listed in pyproject.toml's [tool.poetry.dependencies] section
# - this step is OPTIONAL if you already have poetry install globally
pip3.11 install poetry

# initial poetry configuration (must be done only once)
# to create the .venv/ folder at project's root path when running `poetry env use [python_version]`
poetry config virtualenvs.in-project true

# create an empty virtual environment
# - python_version must match the one listed in pyproject.toml's [tool.poetry.dependencies] section
poetry env use 3.11

# activate virtual environment
source .venv/bin/activate

# install all dependencies listed on pyproject.toml
poetry install
```

## Installation of new dependencies

Adding new dependencies to the project **must be done using poetry**. This will update the
`pyproject.toml` file and the `poetry.lock` file. For more information review the official
[Poetry documentation](https://python-poetry.org/docs/cli/#add).
```bash
# add new dependency to the main group
poetry add [dependency]

# add new dependency to a specific group
poetry add --group dev [dependency]
poetry add --group test [dependency]
```

If you are experimenting and want to delete some dependencies, you can use the `poetry remove [dependecy]` command.

## `requirements[-group].txt` files update

To update the `requirements[-group].txt` files, run the following command:
```bash
poetry export [--with dev] -f requirements.txt --output requirements[-dev].txt --without-hashes
```
the `--with dev` flag is optional and will include the dev dependencies in the `requirements-dev.txt` file.

## Docker run
To run the project using docker, run the following command:
```bash
docker run --rm -it $(docker build -q .)
```

## (OPTIONAL) VSCode Extensions
To install workspace recommended extensions:

1. Open the Command Pallette (Cmd + Shift + P) and search for `Extensions: Install Extensions`
2. Type @recommended in the search bar. This will display all the extensions recommended in `.vscode/extensions.json`
3. To install all recommended extensions click on the `Install Workspace Recommended Extensions` button that will appear at the right-top of the search results (cloud icon).

This will allow you to perform some actions directly from VSCode like linting the code, autoformat, etc.
