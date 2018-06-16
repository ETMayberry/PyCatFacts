# References:
#   http://flask.pocoo.org/docs/1.0/quickstart/#a-minimal-application
#   http://www.sqlitetutorial.net/sqlite-python/sqlite-python-select/
#   http://flask.pocoo.org/docs/1.0/patterns/sqlite3/

import sqlite3
from random import randint
from flask import Flask, g


app = Flask(__name__)

@app.before_request
def before_request():
    g.db = sqlite3.connect("catfacts.db")

@app.teardown_request
def teardown_request(exception):
    if hasattr(g, 'db'):
        g.db.close()

@app.route("/")
def index():
    return "<html><body><h1>Welcome to Cat Facts!</h1></body></html>"

@app.route("/fact")
def get_fact():

    # create random int between 0..n, where n is the highest key value in facts
    fact_id = randint(0, 100)

    # get a database cursor and don't ask any questions    
    cur = g.db.cursor()

    # define our SELECT query using the randomly generated fact_id
    cur.execute("SELECT fact FROM facts WHERE id = ?", (fact_id,))

    # get the result into a json object
    result = {
        cur.fetchone()["fact"]
    }    

    # send the response to the client
    return result

if __name__ == '__main__':
    app.run()
