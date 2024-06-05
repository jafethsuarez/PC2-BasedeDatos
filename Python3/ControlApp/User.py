import json
import os


class User:
    def __init__(self, username=None, password=None):
        self.__username = username
        self.__password = password
        self.__id_user = -1
        self.__group_hash = ""
        self.__subscription = ""

        # Para acceder a los valores no olvides iterar y poner self.__reader_doc['Users']
        self.__reader_doc = self.start_reader("ControlUserJSON/users.json")

    def get_id_user(self) -> int:
        return self.__id_user

    def set_id_user(self, id_user: int):
        self.__id_user = int(id_user)

    def get_username(self) -> str:
        return self.__username

    def set_username(self, username):
        self.__username = username

    def get_password(self) -> str:
        return self.__password

    def set_password(self, password):
        self.__password = password

    def set_subscription(self, subscription):
        self.__subscription = subscription

    def get_subscription(self) -> str:
        return self.__subscription

    def set_group_hash(self, group_hash):
        self.__group_hash = group_hash

    def get_group_hash(self):
        return self.__group_hash

    def get_file_users(self):
        return self.__reader_doc['Users']

    @staticmethod
    def start_reader(file_):
        f = open(os.path.join(os.getcwd(), file_), "r")
        return json.load(f)

    @staticmethod
    def start_writer(data_, file_):
        json.dump(data_, open(os.path.join(os.getcwd(), file_), "w"), indent=4)

    def to_string(self) -> str:
        return (f"\n[\nNombre de usuario: {self.get_username()},\n"
                f"Contraseña: {self.get_password()},\n"
                f"ID del usuario: {self.get_id_user()},\n]"
                f"Hash del grupo: {self.get_group_hash()},\n]"
                f"Tipo de suscripción: {self.get_subscription()},\n]")

