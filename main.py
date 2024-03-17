# from ControlApp.CreateCSV import create_csv_raw
from ControlApp.insertDatabase import insert_data_in_db
from ControlApp.GetDataWebScrapping import WebScrapping
from ControlApp.GetDataWebScrappingFantasy import WebScrappingFantasy
from ControlApp.RegisterUser import RegisterUser as RegisterUser
from ControlApp.LoginUser import Login as LoginUser
from ControlApp.GetDataPlayersTransferMarket import GetDataRequest


def main_function():
    """response = GetDataRequest()
    response.get_clubs()

    # UPDATE DATA SCRAPPING
    WebScrapping()
    WebScrappingFantasy()"""

    # CREATE FINAL CSV FOR RAPIDMINER
    insert_data_in_db()

    """
    user_login = LoginUser("camilo", "12345")
    print(user_login.to_string())

    user_register = RegisterUser(
        username="camilo",
        password="12345",
        name_team="DraftKings",
        crete_new_group=True)

    if user_register.check_if_user_add_success():
        print(f"yes, {user_register.get_username()} user was added")
    else:
        print("no, we couldn't add new user")
    """


if __name__ == "__main__":
    try:
        main_function()
    except KeyboardInterrupt:
        print("Programme interrupted.")
