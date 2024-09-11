from todo_project import app, db

if __name__ == '__main__':
    app.run(debug=True)

@app.before_first_request
def create_tables():
    db.create_all()