import os
import re
import time
import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

BASE = os.path.expanduser(
    "~/.local/share/twintaillauncher/games/hk4e_global"
)

API_HOST = "public-operation-hk4e-sg.hoyoverse.com"

def find_data2():
    for root, dirs, files in os.walk(BASE):
        if root.endswith("Cache/Cache_Data") and "data_2" in files:
            return os.path.join(root, "data_2")
    return None

def test_url(url):
    u = urlparse(url)
    q = parse_qs(u.query)

    q["lang"] = ["en"]
    q["gacha_type"] = ["301"]
    q["size"] = ["5"]

    new = u._replace(
        netloc=API_HOST,
        path="/gacha_info/api/getGachaLog",
        query=urlencode(q, doseq=True),
        fragment=""
    )

    try:
        r = requests.get(urlunparse(new), timeout=10)
        return '"retcode":0' in r.text
    except:
        return False


print("Searching for data_2...")

data2 = find_data2()
if not data2:
    print("[-] data_2 not found!")
    exit()

print("Found:", data2)

with open(data2, "r", errors="ignore") as f:
    content = f.read()

splitted = content.split("1/0/")
found = [x for x in splitted if "webview_gacha" in x]

print(f"Candidates: {len(found)}")

final = None

for i in range(len(found)-1, -1, -1):
    m = re.search(r"(https.+?game_biz=)", found[i])
    if not m:
        continue

    link = m.group(1)
    print(f"\rChecking {i}", end="", flush=True)

    if test_url(link):
        final = link
        break

    time.sleep(1)

print("\n")

if not final:
    print("No valid link found")
    exit()

print("URL:")
print(final)
