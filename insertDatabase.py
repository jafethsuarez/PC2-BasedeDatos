import json

import psycopg2
from fuzzywuzzy import process

try:
    conn = psycopg2.connect(
        database="DraftKingsBD",
        user="admin",
        host='localhost',
        password="admin",
        port=5432
    )

    conn.autocommit = False

    # Si la conexión es exitosa, imprimirá este mensaje.
    print("Conexión a la base de datos establecida con éxito.")

except Exception as e:
    # En caso de error, imprimirá el mensaje de error.
    print(f"Ocurrió un error al conectar con la base de datos: {e}")

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

with open('C:\Users\MarcosJafeth\Documents\UE\ProyectoCompu\PC2-BasedeDatos', 'r') as file1:
    data_api = json.load(file1)['Players']
    data_api_index = {item['name']: item for item in data_api}

with open('C:\Users\MarcosJafeth\Documents\UE\ProyectoCompu\PC2-BasedeDatos', 'r') as file2:
    data_mister = json.load(file2)['Players']
    data_mister_index = {item['name']: item for item in data_mister}

with open('C:\Users\MarcosJafeth\Documents\UE\ProyectoCompu\PC2-BasedeDatos', 'r') as file3:
    data_fantasy = json.load(file3)['Players']
    data_fantasy_index = {item['name']: item for item in data_fantasy}


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


def insert_data_in_db():
    cur = conn.cursor()
    pair_data(cur)
    conn.close()


def pair_data(cur):
    data_to_players_column = []
    data_to_stats_players_column = []

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

        query_player_id = f"SELECT `id_jugador` FROM jugador WHERE `name` = '{name_mister}';"
        cur.execute(query_player_id)
        id_player = cur.fetchone()

        query_team_id = f"SELECT e.* FROM equipos e JOIN jugador j ON j.equipo_id = e.id_equipo WHERE j.id_jugador = {id_player};"
        cur.execute(query_team_id)
        id_team = cur.fetchone()

        if item_api[0] and item_fantasy[0]:
            data_to_players_column.append((name_mister, item_api[1].get('foot', '---'), item_api[1].get('team', '---'),
                                           item_api[1].get('shortNamePosition', '---'), item_api[1].get('age', -1),
                                           item_api[1].get('shirtNumber', '---'), item_mister.get('marketValue', -1),
                                           item_api[1].get('nationality', '---'), item_api[1].get('image', '---'),
                                           id_team))

            data_to_stats_players_column.append((id_player, item_mister.get('fluctuationValue', '---'),
                                                 item_mister.get('average', -1), item_mister.get('scorePlayer', -1),
                                                 item_mister.get('points_antepenultimate_match', '-'),
                                                 item_fantasy[1].get('game_played', '-'),
                                                 item_fantasy[1].get('minutes_played', '-'),
                                                 item_fantasy[1].get('goals', '-'),
                                                 item_fantasy[1].get('assists', '-'),
                                                 item_fantasy[1].get('assists_without_goal', '-'),
                                                 item_fantasy[1].get('balls_into_area', '-'),
                                                 item_fantasy[1].get('clearances', '-'),
                                                 item_fantasy[1].get('dribbles', '-'),
                                                 item_fantasy[1].get('kicks_to_goal', '-'),
                                                 item_fantasy[1].get('recovered_balls', '-'),
                                                 item_fantasy[1].get('possession_loss', '-'),
                                                 item_fantasy[1].get('penaltis_failed', '-'),
                                                 item_fantasy[1].get('goals_against', '-'),
                                                 item_fantasy[1].get('red_cards', '-'),
                                                 item_fantasy[1].get('ball_stop', '-'),
                                                 item_fantasy[1].get('penalties_made', '-'),
                                                 item_fantasy[1].get('yellow_cards', '-'),
                                                 item_fantasy[1].get('second_yellow_card_match', '-'),
                                                 item_fantasy[1].get('penalties_caused', '-'),
                                                 item_fantasy[1].get('penalties_stopped', '-'),
                                                 item_fantasy[1].get('own_goals', '-'),
                                                 ))
        else:
            if item_api[0] and not item_fantasy[0]:
                data_to_players_column.append(
                    (name_mister, item_api[1].get('foot', '---'), item_api[1].get('team', '---'),
                     item_api[1].get('shortNamePosition', '---'), item_api[1].get('age', -1),
                     item_api[1].get('shirtNumber', '---'), item_mister.get('marketValue', -1),
                     item_api[1].get('nationality', '---'), item_api[1].get('image', '---'),
                     id_team))

                data_to_stats_players_column.append((id_player, item_mister.get('fluctuationValue', '---'),
                                                     item_mister.get('average', -1), item_mister.get('scorePlayer', -1),
                                                     item_mister.get('points_antepenultimate_match', '-'),
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     "",
                                                     ""))

            elif not item_api[0] and item_fantasy[0]:
                data_to_players_column.append((name_mister, "", "", "", "", "", item_mister.get('marketValue', -1),
                                               "", "", id_team))

                data_to_stats_players_column.append((id_player, item_mister.get('fluctuationValue', '---'),
                                                     item_mister.get('average', -1), item_mister.get('scorePlayer', -1),
                                                     item_mister.get('points_antepenultimate_match', '-'),
                                                     item_fantasy[1].get('game_played', '-'),
                                                     item_fantasy[1].get('minutes_played', '-'),
                                                     item_fantasy[1].get('goals', '-'),
                                                     item_fantasy[1].get('assists', '-'),
                                                     item_fantasy[1].get('assists_without_goal', '-'),
                                                     item_fantasy[1].get('balls_into_area', '-'),
                                                     item_fantasy[1].get('clearances', '-'),
                                                     item_fantasy[1].get('dribbles', '-'),
                                                     item_fantasy[1].get('kicks_to_goal', '-'),
                                                     item_fantasy[1].get('recovered_balls', '-'),
                                                     item_fantasy[1].get('possession_loss', '-'),
                                                     item_fantasy[1].get('penaltis_failed', '-'),
                                                     item_fantasy[1].get('goals_against', '-'),
                                                     item_fantasy[1].get('red_cards', '-'),
                                                     item_fantasy[1].get('ball_stop', '-'),
                                                     item_fantasy[1].get('penalties_made', '-'),
                                                     item_fantasy[1].get('yellow_cards', '-'),
                                                     item_fantasy[1].get('second_yellow_card_match', '-'),
                                                     item_fantasy[1].get('penalties_caused', '-'),
                                                     item_fantasy[1].get('penalties_stopped', '-'),
                                                     item_fantasy[1].get('own_goals', '-'),
                                                     ))

    insert_into_db(cur, data_to_players_column, data_to_stats_players_column)


def insert_into_db(cur, data_to_players_column, data_to_stats_players_column):
    # query_player = "INSERT INTO jugador (`name`, foot, team, shortnameposition, age, shirtnumber, marketvaluemisterfantazy, nationality, imageurl, equipo_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
    query_stats = "INSERT INTO estadisticasjugador (id_jugador, fluctuationvalue, average, scoreplayer, points_antepenultimate_match, game_played, minutes_played, goals, assists, assists_without_goal, balls_into_area, clearances, dribbles, kicks_to_goal, recovered_balls, possession_loss, penaltis_failed, goals_against, red_cards, ball_stop, penalties_made, yellow_cards, second_yellow_card_match, penalties_caused, penalties_stopped, own_goals) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"

    for i_ in range(len(data_to_players_column)):
        cur.execute(query_stats, data_to_stats_players_column[i_])

    conn.commit()
    cur.close()
    