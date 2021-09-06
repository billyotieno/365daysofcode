import requests


def main():
    resp = requests.get("https://api.github.com")
    print(resp)


if __name__=="__main__":
    main()