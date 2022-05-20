import clips
import logging
from random import randint

logging.basicConfig(level=10, format='%(message)s')
env = clips.Environment()
router = clips.LoggingRouter()
env.load('clips.clp')
template = env.find_template('PR')

for i in range(6):
    template.assert_fact(zone=randint(0, 20), type=randint(1, 3), people=randint(1, 100), agressors=randint(1, 3),
                         guns=randint(0, 1))
    print("-----------------")
    env.run()
    for i in env.facts():
        print(i)
    env.reset()
