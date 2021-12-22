## Run instructions
To run this , open a terminal or equivalant, and make sure you are in the same folder as drinks.py.
And run with below command:

`export FLASK_APP=cafes`

`python3 -m flask run`

If your machine does not have Flask installed. Please install Flask with:

`pip install Flask`

If your machine does not have flask-mysql installed. Please install with:

`pip install flask-mysqldb`

If `pip` is not installed, please follow instructions to install `pip` here: https://pip.pypa.io/en/stable/installation/ 

### Seed data:
Please see exported_all_data.sql for the seed data of this task.

### Assumptions:
1. When creating cafe or employee with the POST end point, the data will be provided in json format.
2. For POST endpoint /cafe - creating a new cafe, the json format is expected to be:

    `{"name": "ACafe"', "description": "A New Cafe", "logo": "alinktologofile.png", "location":"Somewhere" } `

3. For creating employee, cafe name and days_worked will be provided, the json format is expected to be:

    `{"name":"Abc", "days_worked":"1", "cafe":"ACafe"}`

4. Because of point 2, I have added additional constrain on cafe's "name" forcing it to be unique
