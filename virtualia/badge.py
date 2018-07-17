from selenium import webdriver
import os


if __name__ == '__main__':
    driver = webdriver.Chrome(executable_path=os.path.join(os.path.dirname(__file__), 'lib/chromedriver'))
    driver.get('http://virtualia.pn.int/Deconnexion.asp')
    driver.get('http://virtualia.pn.int/')

    field_nom = driver.find_element_by_id('txtNom')
    field_nom.send_keys(os.environ['VIRTUALIA_NOM'])

    field_prenom = driver.find_element_by_id('txtPrenom')
    field_prenom.send_keys(os.environ['VIRTUALIA_PRENOM'])

    field_password = driver.find_element_by_id('txtPassword')
    field_password.send_keys(os.environ['VIRTUALIA_PASSWORD'])

    submit = driver.find_element_by_id('submit')
    submit.send_keys('\n')
