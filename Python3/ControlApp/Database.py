import psycopg2
from psycopg2 import sql
from sshtunnel import SSHTunnelForwarder


class Database:
    def __init__(self, db_port=5433):
        self.ssh_host = "195.235.211.197"
        self.ssh_port = 35005
        self.ssh_username = "ubuntu"
        self.ssh_private_key = "/Users/camilo/.ssh/pc2"
        self.db_host = "127.0.0.1"
        self.db_port = db_port
        self.database = "draftkingbbdd"
        self.user = "dk"
        self.password = "123456"
        self.conn = None
        self.server = None

    def connect(self):
        if self.conn is None:
            try:
                self.server = SSHTunnelForwarder(
                    (self.ssh_host, self.ssh_port),
                    ssh_username=self.ssh_username,
                    ssh_pkey=self.ssh_private_key,
                    remote_bind_address=(self.db_host, self.db_port),
                    local_bind_address=('localhost', 5433),
                    set_keepalive=30
                )
                self.server.start()
                print("Túnel SSH establecido.")

                self.conn = psycopg2.connect(
                    host=self.server.local_bind_host,
                    database=self.database,
                    user=self.user,
                    password=self.password,
                    port=self.server.local_bind_port
                )
                print("Conexión exitosa a la base de datos.")
            except Exception as e:
                print(f"Error al conectar a la base de datos: {e}")
                self.conn = None

    def close(self):
        if self.conn is not None:
            self.conn.close()
            print("Conexión cerrada.")
            self.conn = None
        if self.server is not None:
            self.server.stop()
            print("Túnel SSH cerrado.")
            self.server = None

    def get_player_id(self, name, real_team):
        if self.conn is None:
            print("No hay conexión a la base de datos.")
            return None
        query = sql.SQL("SELECT id FROM football_players WHERE name = %s AND real_team = %s")
        with self.conn.cursor() as cursor:
            cursor.execute(query, (name, real_team))
            result = cursor.fetchone()
            if result:
                return result[0]
            return None

    def insert_player(self, player):
        if self.conn is None:
            print("No hay conexión a la base de datos.")
            return None
        query = sql.SQL("""
            INSERT INTO football_players (name, real_team, foot, image_url, fantasy_position, 
                                 position_short_name, position_group, age, shirt_number, nationality) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING id
        """)
        with self.conn.cursor() as cursor:
            cursor.execute(query, (
                player['name'], player['real_team'], player['foot'], player['image_url'],
                player['fantasy_position'], player['position_short_name'], player['position_group'],
                player['age'], player['shirt_number'], player['nationality']
            ))
            player_id = cursor.fetchone()[0]
            self.conn.commit()
            return player_id

    def insert_player_stats(self, player_id, stats):
        if self.conn is None:
            print("No hay conexión a la base de datos.")
            return
        query = sql.SQL("""
            INSERT INTO player_stats (football_player_id, real_market_value, fantasy_market_value, 
                                      value_fluctuation, average_rating, score, points_from_penultimate_match, 
                                      games_played, minutes_played, goals, assists, assists_no_goal, 
                                      balls_into_box, clearances, dribbles, shots_on_goal, 
                                      balls_recovered, possession_losses, penalties_scored, 
                                      yellow_cards, second_yellow_cards, penalties_won, 
                                      penalties_saved, own_goals) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """)

        with self.conn.cursor() as cursor:
            cursor.execute(query, (
                player_id, stats['real_market_value'], stats['fantasy_market_value'], stats['value_fluctuation'],
                stats['average_rating'], stats['score'], stats['points_from_antepenultimate_match'],
                stats['games_played'], stats['minutes_played'], stats['goals'], stats['assists'],
                stats['assists_no_goal'], stats['balls_into_box'], stats['clearances'], stats['dribbles'],
                stats['shots_on_goal'], stats['balls_recovered'], stats['possession_losses'],
                stats['penalties_scored'], stats['yellow_cards'], stats['second_yellow_cards'],
                stats['penalties_won'], stats['penalties_saved'], stats['own_goals']
            ))
            self.conn.commit()

    def process_players(self, players):
        for player in players:
            player_id = self.get_player_id(player['name'], player['real_team'])
            if player_id is None:
                player_id = self.insert_player(player)
            self.insert_player_stats(player_id, player)
