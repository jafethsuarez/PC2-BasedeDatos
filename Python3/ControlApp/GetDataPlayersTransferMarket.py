import os

import unicodedata

import requests
import json


class GetDataRequest:

    def __init__(self):
        self.__url_clubs = "https://transfermarket.p.rapidapi.com/clubs/list-by-competition"
        self.__querystring = {"id": "ES1", "domain": "es"}

        self.__headers = {
            "X-RapidAPI-Key": "00c517b3fdmsh65de3b7e9815eafp175554jsnbc335e7828dc",
            #"X-RapidAPI-Key": "a29393470amsh407c5edd01d3190p1b123djsndf3952f389a8",
            "X-RapidAPI-Host": "transfermarket.p.rapidapi.com"
        }

    def get_query(self):
        return self.__querystring

    def get_headers(self):
        return self.__headers

    def get_url(self):
        return self.__url_clubs

    def get_response(self, _url, _query):
        response = requests.get(_url, headers=self.__headers, params=_query)
        return response.json()

    @staticmethod
    def to_string(response):
        print(json.dumps(response, indent=4))

    @staticmethod
    def transform_unicode(val):
        return unicodedata.normalize('NFD', val).encode('ascii', 'ignore').decode("utf-8"),

    @staticmethod
    def transform_name(name):
        words = name.split()
        if len(words) == 2:
            word = words[0][0] + '. ' + "".join(words[1])
        elif len(words) > 2:
            word = ""
            for n_ in range(len(words)):
                if n_ < len(words) - 1:
                    word += f"{words[n_][0]}. "
                else:
                    word += words[n_]
        else:
            word = name
        return word

    def get_clubs(self):
        players = {"Players": []}
        clubs = self.get_response(self.__url_clubs, self.__querystring)
        url_players = "https://transfermarket.p.rapidapi.com/clubs/get-squad"

        for club in clubs['clubs']:
            query_players = {"id": club['id'], "saison_id": "2023", "domain": "es"}

            for player in self.get_response(url_players, query_players)['squad']:
                players['Players'].append({
                    'name': self.transform_unicode(self.transform_name(player['name']))[0].title(),
                    'foot': player['foot'],
                    'team': club['name'],
                    'image': player['image'],
                    'shortNamePosition': player['positions']['first']['shortName'],
                    'groupPosition': player['positions']['first']['group'],
                    'age': player['age'],
                    'shirtNumber': player['shirtNumber'],
                    'marketValue': player['marketValue']['value'],
                    'nationality': player['nationalities'][0]['name']
                })

        with open(f'{os.getcwd()}/PlayersJSON/TransferMarket.json', "w") as filePlayers:
            json.dump(players, filePlayers, indent=4)
