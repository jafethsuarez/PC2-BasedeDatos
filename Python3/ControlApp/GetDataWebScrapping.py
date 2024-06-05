import json
import os
import time
import unicodedata
from sys import platform

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class WebScrapping:

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
        time.sleep(5)
        self.go_mundo_deportivo()

    def go_mundo_deportivo(self):
        self.driver.get('https://mister.mundodeportivo.com/')
        self.remove_cookies()

    def remove_cookies(self):
        button_popup = self.driver.find_element(By.ID, "didomi-notice-learn-more-button")
        button_popup.click()
        footer_element = WebDriverWait(self.driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "didomi-consent-popup-footer"))
        )

        button_popup = footer_element.find_element(By.CLASS_NAME, "didomi-components-button")
        button_popup.click()

        for i in range(1, 5):
            button_popup = self.driver.find_element(By.CLASS_NAME, "btn.btn--capsule.btn--primary")
            button_popup.click()
        button_popup = self.driver.find_element(By.CLASS_NAME, "btn.btn--capsule.btn--plain")
        button_popup.click()
        self.login_action()

    def login_action(self):
        div_container = self.driver.find_element(By.CLASS_NAME,
                                                 "container.container--v-spaced.container--h-spaced.container-login")
        user_field = div_container.find_element(By.ID, "email")
        password_field = div_container.find_element(By.CSS_SELECTOR, 'input[placeholder="Contraseña"]')

        user_field.send_keys("Draftkingsue@gmail.com")
        password_field.send_keys("DraftKings2023!")

        div_container_login = self.driver.find_element(By.CLASS_NAME,
                                                       "container.container--v-spaced.container--h-spaced.container"
                                                       "-login")
        form_inputs = div_container_login.find_element(By.CLASS_NAME, "inputs")
        continue_button = form_inputs.find_element(By.CLASS_NAME, "btn.btn--capsule.btn--primary")
        continue_button.click()
        self.driver.implicitly_wait(3)
        self.search_players()

    def search_players(self):
        self.driver.find_element(By.ID, "content")
        self.driver.find_element(By.ID, "lock")
        self.driver.find_element(By.CLASS_NAME, "header-top")
        elemento = self.driver.find_element(By.CSS_SELECTOR,
                                            ".header-top .header-top-right "
                                            ".btn.btn-sw.btn-search-players.btn-header-top")
        elemento.click()

        selector = ".sw-topbar .sw-top-bottom .buttons-players .btn.btn-border.search-players-sort"
        elemento = self.driver.find_element(By.CSS_SELECTOR, selector)
        elemento.click()

        select_element = self.driver.find_element(By.XPATH, "//option[@value='3']")
        select_element.click()
        time.sleep(5)

        for i in range(0, 10):
            selector = ".sw-content .btn-wrapper .btn.btn-grey.search-players-more"
            elemento = self.driver.find_element(By.CSS_SELECTOR, selector)
            elemento.click()
            # Esperar 1 segundos
            time.sleep(2)
        time.sleep(3)
        self.working_with_players_data()

    def working_with_players_data(self):
        players = {'Players': []}
        div_element = self.driver.find_element(By.CLASS_NAME, "wrapper.sw-players")
        ul_elements = div_element.find_elements(By.CSS_SELECTOR,
                                                "div.player-row")
        cont = 1
        for ul in ul_elements:
            try:
                price_ = ul.find_element(By.CLASS_NAME, "underName").text.split(" ")

                if len(price_) > 1:
                    market_value = price_[1]
                    if '↑' in price_:
                        fluctuation_value = 'UP'
                    else:
                        fluctuation_value = 'DOWN'
                else:
                    market_value = price_[0]
                    fluctuation_value = 'REGULAR'

                player = {
                    "name": unicodedata.normalize('NFD', self.transform_name(ul.find_element(By.CLASS_NAME, "name").text)).encode('ascii', 'ignore').decode("utf-8").title(),
                    "marketValue": market_value,
                    "fluctuationValue": fluctuation_value,
                    "average": ul.find_element(By.CLASS_NAME, "avg").text,
                    "scorePlayer": ul.find_element(By.CLASS_NAME, "points").text,
                    "points_antepenultimate_match": ul.find_element(By.CSS_SELECTOR, '[class^="bg-"]').text,
                }

                players['Players'].append(player)
                print(f"{cont}: Jugador procesado: {player}")
            except Exception as e:
                print(f"Error al procesar un jugador: {e}")

            time.sleep(1)
            cont += 1

        with open('PlayersJSON/WebScrapping.json', 'w') as filePlayers:
            json.dump(players, filePlayers, indent=4)

    @staticmethod
    def transform_name(name):
        words = name.strip().split()
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

