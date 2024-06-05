from ControlApp.CreateCSV import create_csv_raw
from ControlApp.GetDataWebScrapping import WebScrapping
from ControlApp.GetDataWebScrappingFantasy import WebScrappingFantasy
from ControlApp.RegisterUser import RegisterUser as RegisterUser
from ControlApp.LoginUser import Login as LoginUser
from ControlApp.GetDataPlayersTransferMarket import GetDataRequest


def main_function():
    # response = GetDataRequest()
    # response.get_clubs()

    # UPDATE DATA SCRAPPING
    # WebScrapping()
    # WebScrappingFantasy()

    # INSERTAR EN BASE DE DATOS
    create_csv_raw()


if __name__ == "__main__":
    try:
        main_function()
    except KeyboardInterrupt:
        print("Programme interrupted.")
