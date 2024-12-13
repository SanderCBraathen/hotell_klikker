from flask import Flask, render_template_string, request, redirect
import mysql.connector

app = Flask(__name__)

# HTML template as a string
html_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Highscore</title>
</head>
<body>
    <h1>Highscore Table</h1>
    <table border="1">
        <thead>
           <tr>
                 <td>{{ row[1] }}</td> <!-- Name column -->
                 <td>{{ row[2] }}</td> <!-- Score column -->
            </tr>

        </thead>
            <tbody>
                {% for row in results %}  <!-- Loop through each row in the 'results' list -->
                <tr>
                    <td>{{ row[1] }}</td>  <!-- Display the 'name' column -->
                    <td>{{ row[2] }}</td>  <!-- Display the 'score' column -->
                </tr>
                {% endfor %}
            </tbody>
    </table>

    <h2>Submit Your Highscore</h2>
    <form action="/submit" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="score">Score:</label>
        <input type="number" id="score" name="score" required>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
"""

@app.route("/")
def show_highscores():
    # Connect to the database using the given credentials
    conn = mysql.connector.connect(
        host="localhost",       # Database host, usually 'localhost' for local development
        username="manager",     # Username for database authentication
        password="sigma",       # Password for the database user
        database="capitaclicker" # Name of the database to connect to
    )

    cursor = conn.cursor()  # Create a cursor object to execute queries
    cursor.execute("SELECT * FROM Highscore")  # Execute SQL query to fetch all rows from 'Highscore' table
    results = cursor.fetchall()  # Fetch all rows returned by the query as a list of tuples
    conn.close()  # Close the database connection

    # Render the HTML template with the fetched results
    return render_template_string(html_template, results=results)

@app.route("/submit", methods=["POST"])
def submit_highscore():
    # Get form data from the request
    name = request.form["name"]
    score = request.form["score"]

    # Connect to the database
    conn = mysql.connector.connect(
        host="localhost",       # Database host, usually 'localhost' for local development
        username="root",     # Username for database authentication
        password="",       # Password for the database user
        database="capitaclicker" # Name of the database to connect to
    )

    cursor = conn.cursor()  # Create a cursor object to execute queries
    # Insert the submitted data into the 'Highscore' table
    cursor.execute("INSERT INTO Highscore (name, score) VALUES (%s, %s)", (name, score))
    conn.commit()  # Commit the transaction to save changes
    conn.close()  # Close the database connection

    # Redirect back to the main page to display updated high scores
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)  # Start the Flask development server with debugging enabled
