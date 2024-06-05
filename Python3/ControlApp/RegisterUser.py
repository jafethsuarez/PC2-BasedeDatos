from ControlApp.User import User
from ControlApp.LoginUser import Login as LoginUser
import random


class RegisterUser(User):
    def __init__(self, username: str, password: str, name_team, crete_new_group: bool):
        super().__init__(username, password)

        self.name_team = name_team

        self.file_groups = self.start_reader("ControlUserJSON/groups.json")
        self.user_not_exist = self.check_user_exist() == "Not exist"

        if not crete_new_group and self.check_group_exist():
            self.create_new_user(username, password)

        elif crete_new_group and self.user_not_exist:
            self.create_new_group()
            self.create_new_user(username, password)

    def check_group_exist(self):
        cont = 0
        val = False

        while not val and cont < len(self.file_groups["Groups"]):
            if self.file_groups["Groups"][cont]["name"] == self.name_team:
                self.set_group_hash(self.file_groups["Groups"][cont]["group_hash"])
                val = True
            cont += 1

        return val

    def check_user_exist(self) -> str:
        try_login = LoginUser(self.get_username(), self.get_password())
        return try_login.get_login_result()

    def create_new_user(self, username, password):
        self.set_username(username)
        self.set_password(password)
        self.set_subscription("free")

    def check_if_user_add_success(self):
        val = False

        if self.get_username() != "" and self.get_password() != "" and self.get_group_hash() != "" and self.user_not_exist:
            val = True
            self.add_new_user_to_json_file()

        return val

    def create_new_group(self):
        if not self.check_group_exist():
            val_ = False
            hash_ = ''

            while not val_:
                hash_ = int(''.join(random.choice('0123456789') for _ in range(6)))
                check_exist = False

                for g in self.file_groups["Groups"]:
                    if g["group_hash"] == hash_:
                        check_exist = True

                if not check_exist:
                    val_ = True

            self.file_groups["Groups"].append({
                "name": self.name_team,
                "group_hash": hash_,
                'team': []
            })

            self.set_group_hash(hash_)
            self.start_writer(data_=self.file_groups, file_="ControlUserJSON/groups.json")

    def get_id_group(self):
        val = False
        id_team = 0
        while not val:
            id_team = int(''.join(random.choice('0123456789') for _ in range(10)))
            val = True
            for g in self.file_groups["Groups"]:
                for t in g["team"]:
                    if not t == id_team:
                        val = True
        return id_team

    def add_new_user_to_json_file(self):
        users = self.start_reader("ControlUserJSON/users.json")
        id_team = self.get_id_group()

        users["Users"].append(
            {
                'id': id_team,
                "name": self.get_username(),
                "password": self.get_password(),
                "subscription": self.get_subscription(),
                "group_hash": self.get_group_hash()
            }
        )

        self.start_writer(data_=users, file_="ControlUserJSON/users.json")

        for a in self.file_groups["Groups"]:
            if a['name'] == self.name_team:
                a['team'].append(
                    {id_team: []}
                )
                self.start_writer(data_=self.file_groups, file_="ControlUserJSON/groups.json")

