from bs4 import BeautifulSoup
import requests

urlp="https://www.bbc.co.uk/sport/football/premier-league/scores-fixtures"

html = requests.get(urlp).text

soup = BeautifulSoup(html, 'html.parser')

print("### BBC Football Scores & Fixtures ###")

bbcsport = soup.select("div.sp-c-fixture__wrapper")
for item in bbcsport:
    item.abbr.decompose()
    item.abbr.decompose()
    print(item.get_text(separator=u' '))
