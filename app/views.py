"""
Arquivo com definições de roteamento para a aplicação.

É uma boa prática de programação colocar o mesmo nome do roteamento, da função e do arquivo HTML.
"""

import flask
import random

try:
    # esse bloco de código roda se o código for executado pelo Pycharm
    folder = ''
    from app.models import query_function
except ModuleNotFoundError:
    # esse bloco de código roda se o código for executado pela linha de comando
    from models import query_function


def main(app: flask.app.Flask) -> flask.app.Flask:

    @app.route('/', methods=['GET'])
    def initial_page():
        return flask.render_template('index.html')

    @app.route('/champions', methods=['GET'])
    def champions_page():

        dados = query_function('''SELECT nome_campeao, origem_campeao, classe_campeao FROM campeoes ''')
        for item in dados:
            nome_campeao = dados[0]
            origem_campeao = dados[1]
            classe_campeao = dados[2]

        return flask.render_template('champions.html')

    @app.route('/simulador', methods=['GET'])
    def simulator_page():
        times = ['fluxo', 'furia', 'intz', 'kabum', 'liberty', 'losgrandes', 'loud', 'pain', 'red', 'vivokeyd']
        file_name = 'img/teams/{0}.png'.format(times[random.randint(0, 9)])

        return flask.render_template(
            'simulador.html',
            paragrafo = '<p>O servidor acha que esse time ganhará o CBLOL</p>',
            imagem = '<img id="server-intz" src="' + flask.url_for('static', filename=file_name) + '">'
        )

    @app.errorhandler(404)
    def page_not_found(page):
        return flask.render_template('404.html'), 404

    app.register_error_handler(404, page_not_found)
    app.run(debug=True)

    return app
