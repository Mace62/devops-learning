from flask import Flask
import redis
import os

app = Flask(__name__)

# Get Redis connection details from environment variables
REDIS_HOST = os.getenv('REDIS_HOST', 'redis')
REDIS_PORT = int(os.getenv('REDIS_PORT', 6379))

@app.route('/')
def hello_world():
    return 'We are running our first container - from CoderCo'

@app.route('/count')
def count():
    r = redis.Redis(
        host=REDIS_HOST,
        port=REDIS_PORT,
        decode_responses=True
    )
    r.incr('count')
    count = r.get('count')
    return f'You have visited this page {count} times.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
