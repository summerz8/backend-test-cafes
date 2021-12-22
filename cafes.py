"""
cafes.py - A  Flask application with connecting to local mysql database. 

Usage: Run `export FLASK_APP=cafes` followed by `python3 -m flask run` to ensure the env is py3.

**Please make sure the root password is correctly populated in app.config["MYSQL_PASSWORD"] to connect mysql db.

Project: Building an api to retrieve and transfrom drinks data from two public apis (coffee & beer).

Author: Zhang Shiyu
Date: 21 Dec 2021
"""


from flask import Flask, render_template, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)


app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "cafes"

mysql = MySQL(app)

@app.route("/cafe", methods=["POST"])
def createCafe():
    """Add a new cafe into database"""
    try:
        details = request.get_json()
        name = details["name"].strip()
        description = details["description"].strip()
        location = details["location"].strip()
        logo = details["logo"].strip()
        cur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO cafes (name, description, location, logo, c_uuid) \
                VALUES (%s, %s, %s, %s, UUID())",
            (name, description, location, logo),
        )
        mysql.connection.commit()
        cur.close()
        return "Successfully create a new cafe: \
            {name} at {location}!".format(
            name=name, location=location
        )
    except Exception as e:
        print(e)
        return "failed"



@app.route("/cafe/employee", methods=["POST"])
def addEmployee():
    """Add a new employee into database"""
    try:
        details = request.get_json()
        name = details["name"].strip()
        cafeName = details["cafe"].strip()
        daysWorked = details["days_worked"].strip()
        cur = mysql.connection.cursor()
        cur.execute("SELECT c_id FROM cafes WHERE name = %s", [cafeName])
        c_id = cur.fetchone()
        if c_id:
            cur.execute(
                "INSERT INTO employees ( name, e_uid ) VALUES \
                    (%s, CONCAT('UI', UPPER(LEFT(UUID(), 7))) )",
                [name],
            )
            mysql.connection.commit()
            cur.execute("SELECT MAX( e_id ) FROM employees")
            e_id = cur.fetchone()
            cur.execute(
                "INSERT INTO works ( c_id, e_id, days_worked ) VALUES (%s, %s, %s)",
                (c_id, e_id, daysWorked),
            )
            mysql.connection.commit()
            cur.close()
            return "Successfully create a new employee: \
                        {name} working at {cafe} for {days} days!".format(
                name=name, cafe=cafeName, days=daysWorked
            )
        else:
            return "Error, input cafe =%s is not found!" % (cafeName)
    except Exception as e:
        print(e)
        return "failed"


def postProcessCafeData(data):
    """Post processing cafe data"""
    columnNames = ("name", "description", "logo", "location", "id", "employees")
    result = [dict(zip(columnNames, row)) for row in data]
    return result


@app.route("/cafes", methods=["GET"])
def queryCafes():
    """Query cafes sorted by highest number of days worked"""
    try:
        location = request.args["location"].strip()
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT c.name, c.description, c.logo, c.location, c.c_uuid, COUNT(w.e_id) \
                        FROM cafes c \
                        LEFT JOIN works w \
                        ON c.c_id = w.c_id \
                        WHERE c.location=%s \
                        GROUP BY c.name, c.description, c.logo, c.location, c.c_uuid \
                        ORDER BY COUNT(w.e_id) DESC",
            [location],
        )
        result = cur.fetchall()
        if result:
            response = jsonify(postProcessCafeData(result))
            response.status_code = 200
        else:
            response = jsonify([])
            response.status_code = 200
    except Exception as e:
        print(e)
        response = jsonify("Something went wrong. A location is required")
        response.status_code = 500
    finally:
        return response


def postProcessEmployeeData(data):
    """Post processing employees' data"""
    columnNames = ("name", "days_worked", "cafe", "id")
    result = [dict(zip(columnNames, row)) for row in data]
    return result


@app.route("/cafes/employees", methods=["GET"])
def queryEmployees():
    """Query all employees data sorted by highest number of days worked"""
    try:
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT e.name, w.days_worked,c.name, e.e_uid \
                     FROM employees e, works  w, cafes c \
                     WHERE e.e_id = w.e_id AND w.c_id = c.c_id \
                     ORDER BY w.days_worked DESC"
        )
        result = cur.fetchall()
        if result:
            response = jsonify(postProcessEmployeeData(result))
            response.status_code = 200
        else:
            response = jsonify([])
            response.status_code = 200
    except Exception as e:
        print(e)
        response = jsonify("Something went wrong!")
        response.status_code = 500
    finally:
        return response


if __name__ == "__main__":
    app.run()
