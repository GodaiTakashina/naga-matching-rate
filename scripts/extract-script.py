import sys
from bs4 import BeautifulSoup

with open(sys.argv[1]) as f:
    data = f.read()

soup = BeautifulSoup(data, 'lxml')
script = soup.script.text
print(script)
