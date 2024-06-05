import unicodedata

import time
import json
import os
from sys import platform

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By


class WebScrappingFantasy:

    def __init__(self):
        options = Options()
        options.add_argument('--start-maximized')
        options.add_argument('--disable-extensions')

        if platform == "darwin":
            __DATA_PC = "chromedriver"
        else:
            __DATA_PC = "chromedriver.exe"

        service = Service(f'{os.getcwd()}/chromedriver/{__DATA_PC}')
        self.driver = webdriver.Chrome(service=service, options=options)
        self.driver.set_window_position(1800, 0)
        self.driver.maximize_window()
        time.sleep(2)
        self.go_to_fantasy()

    def go_to_fantasy(self):
        self.driver.get('https://www.analiticafantasy.com/fantasy-la-liga/estadisticas')
        time.sleep(2)

        elemento_span = self.driver.find_element(By.XPATH, "//span[text()='MÁS OPCIONES']")
        elemento_span.click()

        time.sleep(2)
        button = self.driver.find_element(By.XPATH, "//div[contains(@class, 'qc-cmp2-buttons-desktop')]//button[contains(@class, 'css-y8g67k')]")
        button.click()

        time.sleep(2)

        desplegable = self.driver.find_element(By.CSS_SELECTOR, ".MuiSelect-select.MuiSelect-standard.MuiInputBase-input.MuiInput-input")
        desplegable.click()

        time.sleep(2)

        opcion_jornada = self.driver.find_element(By.XPATH, "//li[contains(text(), 'Todas')]")
        opcion_jornada.click()

        self.driver.execute_script("window.scrollBy(0, 850);")

        time.sleep(3)

        select_element = self.driver.find_element(By.CLASS_NAME, 'eYVIYZ')
        select_element.click()

        time.sleep(2)

        opcion = self.driver.find_element(By.XPATH, "//option[@value='30']")
        opcion.click()

        self.driver.execute_script("window.scrollBy(0, 1300);")

        time.sleep(4)
        self.to_save_players()

    @staticmethod
    def transform_unicode(val):
        return unicodedata.normalize('NFD', val).encode('ascii', 'ignore').decode("utf-8"),

    @staticmethod
    def transform_name(name):
        words = name.split()

        if len(words) == 2:
            if len(words[1]) > 2:
                word = words[0][0] + '. ' + "".join(words[1])
            else:
                word = words[0] + '. ' + "".join(words[1])

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

    def to_save_players(self):
        info_jugadores = {'Players': []}
        val_main = True

        while val_main:
            cont = 0
            val_ = True

            while val_:
                try:
                    fila_jugador = self.driver.find_element(By.ID, f'row-{cont}')
                    info_jugadores['Players'].append({
                        "name": self.transform_unicode(self.transform_name(fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="2"]').text))[0].title(),
                        "team": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="6"]').text,
                        "game_played": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="10"]').text,
                        "minutes_played": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="11"]').text,
                        "goals": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="12"]').text,
                        "assists": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="13"]').text,
                        "assists_without_goal": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="14"]').text,
                        "balls_into_area": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="15"]').text,
                        "clearances": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="16"]').text,
                        "dribbles": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="17"]').text,
                        "kicks_to_goal": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="18"]').text,
                        "recovered_balls": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="19"]').text,
                        "possession_loss": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="20"]').text,
                        "penaltis_failed": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="21"]').text,
                        "goals_against": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="22"]').text,
                        "red_cards": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="23"]').text,
                        "ball_stop": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="24"]').text,
                        "penalties_made": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="25"]').text,
                        "yellow_cards": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="26"]').text,
                        "second_yellow_card_in_match": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="27"]').text,
                        "penalties_caused": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="28"]').text,
                        "penalties_stopped": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="29"]').text,
                        "own_goals": fila_jugador.find_element(By.CSS_SELECTOR, '[data-column-id="30"]').text,
                    })
                    cont += 1
                except:
                    val_ = False

            boton_cargar_mas = self.driver.find_element(By.ID, 'pagination-next-page')
            if boton_cargar_mas.get_attribute('aria-disabled') == 'true':
                val_main = False
            else:
                try:
                    boton_cargar_mas.click()
                    time.sleep(1)
                except:
                    val_main = False

        with open('PlayersJSON/fantasy_datos_jugadores.json', 'w') as filePlayers:
            json.dump(info_jugadores, filePlayers, indent=4)


