'''
"Database code" for the DB Forum.
'''
import datetime
import psycopg2


def get_posts():
    """Return all posts from the 'database', most recent first."""
    db = psycopg2.connect('dbname=forum')
    c = db.cursor()
    c.execute("SELECT time, content FROM posts ORDER BY time DESC")
    posts = ({'content': str(row[1]), 'time': str(row[0])} for row in c.fetchall())
    c.close()
    return posts

def add_post(content):
    """Add a post to the 'database' with the current timestamp."""
    db = psycopg2.connect('dbname=forum')
    c = db.cursor()
    c.execute("INSERT INTO posts (content) VALUES (%s)", (content,))
    db.commit()
    c.close()
