from ControlApp.User import User


class Login(User):
    def __init__(self, username: str, password: str):
        super().__init__(username, password)
        self.__login = "Not exist"
        self.login_user()

    def login_user(self):
        cont = 0
        val = False

        while not val and cont < len(self.get_file_users()):
            user_ = self.get_file_users()[cont]

            if user_["name"] == self.get_username() and not user_["password"] == self.get_password():
                self.__login = "Data incorrect"
                val = True
            elif user_["name"] == self.get_username() and user_["password"] == self.get_password():
                self.__login = "Correct"
                self.set_id_user(int(user_["id"]))
                self.set_group_hash(int(user_["group_hash"]))
                self.set_subscription(user_["subscription"])
                val = True

            cont += 1

    def get_login_result(self):
        return self.__login


