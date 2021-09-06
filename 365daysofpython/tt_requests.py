import requests
import pprint
import json
from requests.exceptions import HTTPError


def main():
    resp = requests.get("https://api.github.com")
    print(resp)

    # status codes
    print(resp.status_code)
    if resp.status_code == 200:
        print("server responded successfully")
    else:
        print(f"unabel to fetch resource from server, {resp.status_code}")


    # raise for status if requests not available
    for url in ['https://api.github.com', 'https://api.github.com']:
        try:
            response = requests.get(url)
            
            # If response was successful no exception would be set
            response.raise_for_status()
        except HTTPError as http_err:
            print(f'HTTP error occured: {http_err}')
        except Exception as err:
            print(f'Other error occured: {err}')
        else:
            print("Success!")

    # viewing response payload
    print(response.content)
    print(response.text)
    print(json.loads(response.text))
    print(response.json())

    # Metadata about the response
    print(response.headers)
    pprint.pprint(response.headers)

    headers = response.headers
    print(headers["Date"])

    ## TODO: Max Retries, The Session Object, Timeouts, SSL Certificate Verificaiton, Authentication, The Message Body
    ## TODO: Other HTTP Methods, Request Headers, Query String Parameters, Content, Header, Status Codes



if __name__=="__main__":
    main()