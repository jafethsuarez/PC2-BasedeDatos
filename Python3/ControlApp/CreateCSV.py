import json
import os
import pandas as pd
from datetime import datetime
from fuzzywuzzy import process
from ControlApp.Database import Database as db

list_especial_names = {
    'V. Junior': 'Vinicius Jr.',
    'Y. E. Nesyri': 'En-Nesyri',
    'Y. Gasiorowski': '',
    'N. Fernandez': '',
    'V. Fernandez': '',
    'B. Espinosa': '',
    'R. Fernandez': '',
    'G. Moreno': 'A. Moreno',
    'A. Munoz': 'I. Munoz',
    'E. Avila': 'C. Avila',
    'P. Espino': 'Espino',
    'A. Vinicius': 'Abner',
    'K. Fernandes': 'Kaiky',
    "F. Gimenez": "Fali",
    "L. Vinicius": "Lazaro",
}

list_2_names = {
    "Sandro": "S. Ramirez",
    "R. G. D. Haro": "R. Garcia",  # Osasuna
    "J. C. Martin": "J. Carlos",
    "I. Garcia": "I. G. D. Albeniz",
    "O. Mfulu": "N. Mfulu"
}

list_3_names = {
    "N. Fernandez": "Nacho",
    'A. Lemos': 'Lemos. S',
    'I. Garcia': 'Imanol',
    'C. Ozkacar': 'Cenk',
    'U. Gomez': 'Unai. G',
    'B. Zaragoza': 'Bryan',
    'I. Palazon': 'Isi',
    'A. Srloth': 'Sorloth',
    'G. Alvarez': 'Gaston',
    'S. Niguez': 'Saul',
    'S. Omorodion': 'Samu',
    'R. Marti': 'Roger',
    'F. Lopez': 'Fermin',
    'C. Mosquera': 'Cristhian',
    'M. Depay': 'Memphis',
    'M. E. Haddadi': 'Munir',
    'B. Diaz': 'Brahim',
    'A. Ferreira': 'Andre. F.',
    'Y. Berchiche': 'Yuri',
    'A. Ezzalzouli': 'Abde',
    'A. Prats': 'Abdon',
    'R. D. Tomas': 'Rdt',
    'M. Park': 'Marvin',
    'I. Carcelen': 'Iza',
    'A. Elustondo': 'Aritz',
    'R. Mandava': 'Reinildo',
    'D. Lopy': 'Dion',
    'A. Ratiu': 'Andrei',
    'R. G. D. Haro': 'Raul',  # Osasuna
    'M. Pascual': 'Martin',
    'R. Fernandez': 'Raul. F',
    'S. Clua': 'Selvi',
    'B. Ramirez': 'Benito. J',
    'A. Ndiaye': 'Amath',
    'V. Fernandez': 'Valery',
    'Y. Alvarez': 'Yeray',
    'M. Milovanovic': 'Marezi',
    'B. Espinosa': 'Bernardo',
    'B. B. Diaz': 'B. Brereton',
    'M. Diaz': 'Mariano',
}

with open('PlayersJSON/TransferMarket.json', 'r') as file1:
    data_api = json.load(file1)['Players']
    data_api_index = {item['name']: item for item in data_api}

with open('PlayersJSON/WebScrapping.json', 'r') as file2:
    data_mister = json.load(file2)['Players']
    data_mister_index = {item['name']: item for item in data_mister}

with open('PlayersJSON/fantasy_datos_jugadores.json', 'r') as file3:
    data_fantasy = json.load(file3)['Players']
    data_fantasy_index = {item['name']: item for item in data_fantasy}


def convert_to_float(value):
    if isinstance(value, (int, float)):
        return float(value)
    try:
        cleaned_value = value.replace('.', '').replace(',', '.')
        float_value = float(cleaned_value)
        return float_value
    except ValueError:
        return 0


def create_list_dict_for_csv(name_mister, foot='', team='', image='', positionMisterFantasy='',
                             shortNamePosition='', groupPosition='', age=-1, shirtNumber=-1, marketValueReal='',
                             marketValueMisterFantasy='', nationality='', fluctuationValue='', average=0,
                             scorePlayer=0, points_antepenultimate_match=0, game_played=0, minutes_played=0,
                             goals=0, assists=0, assists_without_goal=0, balls_into_area=0, clearances=0,
                             dribbles=0, kicks_to_goal=0, recovered_balls=0, possession_loss=0, penaltis_failed=0,
                             goals_against=0, red_cards=0, ball_stop=0, penalties_made=0, yellow_cards=0,
                             second_yellow_card_match=0, penalties_caused=0, penalties_stopped=0, own_goals=0):
    return {"name": name_mister, "foot": foot, f"real_team": team, "image_url": image,
            "fantasy_position": positionMisterFantasy, "position_short_name": shortNamePosition,
            "position_group": groupPosition, "age": age, "shirt_number": shirtNumber,
            "nationality": nationality,
            "real_market_value": marketValueReal.replace(".", ""),
            "fantasy_market_value": marketValueMisterFantasy.replace(".", ""),
            "value_fluctuation": fluctuationValue,
            "average_rating": convert_to_float(average),
            f"score": float(scorePlayer),
            "points_from_antepenultimate_match": 0 if points_antepenultimate_match == '-' else int(points_antepenultimate_match),
            "games_played": int(game_played),
            "minutes_played": int(minutes_played),
            "goals": int(goals),
            "assists": int(assists),
            "assists_no_goal": int(assists_without_goal),
            "balls_into_box": int(balls_into_area),
            "clearances": int(clearances),
            "dribbles": int(dribbles),
            "shots_on_goal": int(kicks_to_goal),
            "balls_recovered": int(recovered_balls),
            "possession_losses": int(possession_loss),
            "penaltis_missed": int(penaltis_failed),
            "goals_conceded": int(goals_against),
            "red_cards": int(red_cards),
            "set_pieces": int(ball_stop),
            "penalties_scored": int(penalties_made),
            "yellow_cards": int(yellow_cards),
            "second_yellow_cards": int(second_yellow_card_match),
            "penalties_won": int(penalties_caused),
            "penalties_saved": int(penalties_stopped),
            "own_goals": int(own_goals),
            }


def check_match(name_player, list_search) -> list:
    if name_player != "":
        keys = list(list_search.keys())
        best_match, score = process.extractOne(name_player, keys)

        if score >= 90:
            # Obtener el valor correspondiente a la clave
            final_list = [True, list_search[best_match]]
        else:
            final_list = [False, []]
    else:
        final_list = [False, []]
    return final_list


def check_lists(name_player, list_search) -> list:
    cont = 0
    val = False
    element_2_return = ""
    clave = list(list_search.keys())

    while not val and cont < len(list_search):

        element_1 = name_player.strip().split()  # convertimos el nombre en un array
        element_2 = clave[cont].strip().split()  # cada key del dict lo convertimos en un array, ya que es un nombre

        aux = 0
        if len(element_1) < len(element_2):
            for ele in element_1:
                if ele in element_2:
                    aux += 1
            if aux == len(element_1):
                val = True
                element_2_return = list_search[clave[cont]]

        elif len(element_1) > len(element_2):
            for ele in element_2:
                if ele in element_1:
                    aux += 1
            if aux == len(element_2):
                val = True
                element_2_return = list_search[clave[cont]]

        else:
            if name_player == clave[cont]:
                val = True
                element_2_return = list_search[clave[cont]]

        cont += 1

    if not val:
        if name_player in list_especial_names:
            final_list = check_match(list_especial_names[name_player], list_search)
        else:
            final_list = check_match(name_player, list_search)

    else:
        final_list = [val, element_2_return]

    return final_list


def create_csv_raw():
    connection = db()
    connection.connect()

    data_to_db = clear_data()
    connection.process_players(data_to_db)


def clear_data():
    data_to_db = []

    for name_mister, item_mister in data_mister_index.items():
        if name_mister in list_2_names:
            name_2 = list_2_names[name_mister]
        else:
            name_2 = name_mister
        item_api = check_lists(name_player=name_2, list_search=data_api_index)

        if name_mister in list_3_names:
            name_3 = list_3_names[name_mister]
        else:
            name_3 = name_mister
        item_fantasy = check_lists(name_player=name_3, list_search=data_fantasy_index)

        if item_api[0] and item_fantasy[0]:
            data_to_db.append(create_list_dict_for_csv(name_mister, item_api[1].get('foot', '---'),
                                                       item_api[1].get('team', '---'),
                                                       item_api[1].get('image', '---'),
                                                       item_mister.get('position', -1),
                                                       item_api[1].get('shortNamePosition', '---'),
                                                       item_api[1].get('groupPosition', '---'),
                                                       item_api[1].get('age', -1),
                                                       item_api[1].get('shirtNumber', -1),
                                                       f"{item_api[1].get('marketValue', '-1')}",
                                                       f"{item_mister.get('marketValue', '-1')}",
                                                       item_api[1].get('nationality', '---'),
                                                       item_mister.get('fluctuationValue', ''),
                                                       item_mister.get('average', -1),
                                                       item_mister.get('scorePlayer', -1),
                                                       item_mister.get('points_antepenultimate_match', 0),
                                                       item_fantasy[1].get('game_played', 0),
                                                       item_fantasy[1].get('minutes_played', 0),
                                                       item_fantasy[1].get('goals', 0),
                                                       item_fantasy[1].get('assists', 0),
                                                       item_fantasy[1].get('assists_without_goal', 0),
                                                       item_fantasy[1].get('balls_into_area', 0),
                                                       item_fantasy[1].get('clearances', 0),
                                                       item_fantasy[1].get('dribbles', 0),
                                                       item_fantasy[1].get('kicks_to_goal', 0),
                                                       item_fantasy[1].get('recovered_balls', 0),
                                                       item_fantasy[1].get('possession_loss', 0),
                                                       item_fantasy[1].get('penaltis_failed', 0),
                                                       item_fantasy[1].get('goals_against', 0),
                                                       item_fantasy[1].get('red_cards', 0),
                                                       item_fantasy[1].get('ball_stop', 0),
                                                       item_fantasy[1].get('penalties_made', 0),
                                                       item_fantasy[1].get('yellow_cards', 0),
                                                       item_fantasy[1].get('second_yellow_card_match', 0),
                                                       item_fantasy[1].get('penalties_caused', 0),
                                                       item_fantasy[1].get('penalties_stopped', 0),
                                                       item_fantasy[1].get('own_goals', 0)
                                                       ))
        else:
            if item_api[0] and not item_fantasy[0]:
                data_to_db.append(create_list_dict_for_csv(
                    name_mister, item_api[1].get('foot', '---'),
                    item_api[1].get('team', '---'),
                    item_api[1].get('image', '---'),
                    item_mister.get('position', -1),
                    item_api[1].get('shortNamePosition', '---'),
                    item_api[1].get('groupPosition', '---'),
                    item_api[1].get('age', -1),
                    item_api[1].get('shirtNumber', -1),
                    f"{item_api[1].get('marketValue', '-1')}",
                    f"{item_mister.get('marketValue', '-1')}",
                    item_api[1].get('nationality', '---'),
                    item_mister.get('fluctuationValue', ''),
                    item_mister.get('average', -1),
                    item_mister.get('scorePlayer', -1),
                    item_mister.get('points_antepenultimate_match', 0)
                ))
            elif not item_api[0] and item_fantasy[0]:
                data_to_db.append(create_list_dict_for_csv(
                    name_mister,
                    "",
                    "",
                    "",
                    item_mister.get('position', -1),
                    "",
                    "",
                    -1,
                    -1,
                    "",
                    f"{item_mister.get('marketValue', '-1')}",
                    '',
                    item_mister.get('fluctuationValue', ''),
                    item_mister.get('average', -1),
                    item_mister.get('scorePlayer', -1),
                    item_mister.get('points_antepenultimate_match', 0),
                    item_fantasy[1].get('game_played', 0),
                    item_fantasy[1].get('minutes_played', 0),
                    item_fantasy[1].get('goals', 0),
                    item_fantasy[1].get('assists', 0),
                    item_fantasy[1].get('assists_without_goal', 0),
                    item_fantasy[1].get('balls_into_area', 0),
                    item_fantasy[1].get('clearances', 0),
                    item_fantasy[1].get('dribbles', 0),
                    item_fantasy[1].get('kicks_to_goal', 0),
                    item_fantasy[1].get('recovered_balls', 0),
                    item_fantasy[1].get('possession_loss', 0),
                    item_fantasy[1].get('penaltis_failed', 0),
                    item_fantasy[1].get('goals_against', 0),
                    item_fantasy[1].get('red_cards', 0),
                    item_fantasy[1].get('ball_stop', 0),
                    item_fantasy[1].get('penalties_made', 0),
                    item_fantasy[1].get('yellow_cards', 0),
                    item_fantasy[1].get('second_yellow_card_match', 0),
                    item_fantasy[1].get('penalties_caused', 0),
                    item_fantasy[1].get('penalties_stopped', 0),
                    item_fantasy[1].get('own_goals', 0)
                ))

    return data_to_db
